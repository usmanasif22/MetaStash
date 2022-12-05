class UpdatepaymentController < ApplicationController
    def update
        @user = User.find_by_id(params[:id])
        if @user.nil?  
        render json: {
            message: "Invalid UserId",
             status: 404
          }, status: :ok
        else
            @user.update(payment_status: params[:payment_status])
            if @user.payment_status == true
                @user.payment_date = DateTime.now.utc
                @user.role = "paid"
                render json: {
                    message: "Payment Status updated to true!",
                    status: 200
                  }, status: :ok
            else 
                @user.role = "unpaid"
                render json: {
                    message: "Payment Status updated to false!",
                    status: 200
                  }, status: :ok
            end
            @user.save
        end
      end
end
