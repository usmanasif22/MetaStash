class Users::RegistrationsController < Devise::RegistrationsController
  protect_from_forgery prepend: true
  protect_from_forgery with: :exception, if: Proc.new { |c| c.request.format != 'application/json' }
    protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
  
    before_action :authenticate_user!
  respond_to :json
  
  private
  def respond_with(resource, _opts = {})
    resource.persisted? ? register_success : register_failed
  end

  def register_success
    UserMailer.welcome_email(@user).deliver
    render json: {
    message: "Welcome! You have signed up successfully.",
    user: current_user, status: 200
  }, status: :ok
  end

  def register_failed
    render json: { message: 'User already exists', status: 500 }, status: :ok
  end
end