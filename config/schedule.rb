# Use this file to easily define all of your cron jobs.
#
#
env :PATH, ENV['PATH']
set :output, "./log/drops.log"

every 1.day, at: '1:26 pm' do
   runner "puts Time.now"
   rake "dist_drops:distribute"
   end

every 1.day do
   runner "puts Time.now"
   rake "poll:destroy"
   runner "puts 30days old poll expired"
 end

 every 1.day do
   runner "puts Time.now"
   rake "payment:changestatus"
 end