class FeedbackController < ApplicationController

    def index
        @feedbacks = Feedback.all 
        if @feedbacks.present?
            render json: {status:200, data: @feedbacks}, status: :ok
        else
            render json: {message:"No Feedbacks available to resolve",status:404}, status: :ok
        end
    end 
    
    def show
        @feedback = Feedback.find(params[:id])
        render json: { data: @feedback, status:200}, status: :ok
    end 
    
    def create
        @user = User.find_by_id(params[:id])
        if @user.present?
            @feedback = Feedback.create(
                user_id: params[:id],
                message_heading: params[:message_heading],
                message_details: params[:message_details]
            )
            render json: { data: @feedback, status:200}, status: :ok
        else
            render json: {message: "Invalid UserId", status: 404}, status: :ok
        end
    end

    def update
        @feedbacks = Feedback.all 
        @feedback = Feedback.find(params[:id])
        @feedback.is_resolved = true
        @feedback.save!
        render json: { status:200, data: @feedbacks}, status: :ok
    end 
    
end