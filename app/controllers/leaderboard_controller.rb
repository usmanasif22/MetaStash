class LeaderboardController < ApplicationController
    def index
        @users = User.all
        if @users.present?
            @temp = @users.order(total_collection: :desc)
             @user = @temp.to_json(:only => [:id, :name, :total_collection])
            render json: {status:200, data: JSON.parse(@user)}, status: :ok
        else
            render json: {message:"No Users available", status:404}, status: :ok
        end
    end
end
