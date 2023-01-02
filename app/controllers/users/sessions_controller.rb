class Users::SessionsController < Devise::SessionsController
  protect_from_forgery prepend: true
  protect_from_forgery with: :exception, if: Proc.new { |c| c.request.format != 'application/json' }
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
  
  before_action :authenticate_user!
  respond_to :json

  def destroy
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    set_flash_message! :notice, :signed_out if signed_out
    yield if block_given?
    respond_to_on_destroy
  end
  
  def create
    self.resource = User.find_by(email: params[:user][:email])
    resource.present? ? login_user : show_invalid_message
  end

  private
  def login_user
    if self.resource.valid_password?(params[:user][:password])
      self.resource = warden.authenticate!(auth_options)
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    yield resource if block_given?
    respond_with resource, location: after_sign_in_path_for(resource)
    else
      render json: { message: 'Invalid Password!', status: 401}, status: :ok
    end
  end

  def show_invalid_message
    render json: { message: 'No User Exist with this Email!', status: 404}, status: :ok
  end

  def respond_with(resource, _opts = {})
    render json: { data: { message: 'Login successfully!',user: current_user, status: 200 } }, status: :ok
  end

  def respond_to_on_destroy
    
    if current_user
      render json: {
        status: 200,
        message: "logged out successfully"
      }, status: :ok
    else
      render json: {
        status: 401,
        message: "Couldn't find an active session."
      }, status: :unauthorized
    end
  end
  # def respond_to_on_destroy
  #   current_user.present? ? log_out_failure : log_out_success
  # end

  # def log_out_success
  #   render json: { message: "Logged out successfully!", status: 200 }, status: :ok
  # end

  # def log_out_failure
  #   render json: { message: "Logged out failure.", status: 500}, status: :ok
  # end

  # def current_token
  #   request.env['warden-jwt_auth.token']
  # end
end