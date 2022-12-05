desc "After 30 days change payment status"
namespace :payment do
    task changestatus: :environment do
        @user = User.where(payment_status: true)
        if @user.present?
            for a in 1..@user.length do
                if @user[a-1].payment_date <= (Time.now - 30.days)
                    @user[a-1].payment_status = false
                    @user[a-1].role = "unpaid"
                    puts "User: " + @user[a-1].name + " payment_status changed to false."
                    @user[a-1].save
                else
                    puts "Nothing Changed"
                end
            end
        else
            puts "No User Found"
        end
    end
end
