desc "At UTC 00:00 Collect & Distrubute Total Drops Value equally"
namespace :dist_drops do
    task distribute: :environment do
        puts "Distribution start..."
        @active_drop = Drop.where(is_active: true)
        @sum=0
        for a in 1..@active_drop.length do
            @sum = @sum + @active_drop[a-1].reward_amount
        end
         puts " Sum of active drops is: " + @sum.to_s
        @drops = Drop.all
        @amount = @sum / @drops.length
        @amount = @amount.to_d.truncate(2)
        puts @amount.to_s + "$ will be distributed among all drops " 
        for a in 1..@drops.length do
            @drops[a-1].reward_amount = @amount
            @drops[a-1].is_active = true
            @drops[a-1].save
        end
    end

end