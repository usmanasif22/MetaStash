class GetuserinformationController < ApplicationController
    def show
        @user = User.find_by_id(params[:id])
        if @user.nil?  
          render json: {
              message: "Invalid UserId",
               status: 404
            }, status: :ok
        else
        render json: {
            user: @user,
            status: 200
          }, status: :ok
        end
    end

    def changeAvatar
        @user = User.find_by_id(params[:id])
        @avatar = params[:avatar]
        if @user.nil?  
          render json: {
              message: "Invalid UserId",
               status: 404
            }, status: :ok
        elsif @avatar.nil?
            render json: {
              message: "Invalid AvatarID",
               status: 404
            }, status: :ok
        else
            @user.avatar = @avatar
            @user.save
            render json: {
              message: "Avatar Changed",
              avatar: @user.avatar,
               status: 200
            }, status: :ok
        end
    end
end
