namespace :poll do
  desc "TODO"
  task destroy: :environment do
    @poll = Poll.where(is_active: true)
    if @poll.present?
      puts "Checking Poll status..."
      if @poll[0].created_at <= (Time.now - 30.days)
        puts "Setting Poll to Active false..."
        @user = User.where(vote_casted: true)
        for a in 1..@user.length do
          @user[a-1].vote_casted = false 
          @user[a-1].save
          # puts "User id" + @user[a-1].id + " vote_casted to false."
        end
        @poll[0].is_active = false
        @poll[0].save
      end
    else
      puts "No Active Poll available."
    end
  end
end