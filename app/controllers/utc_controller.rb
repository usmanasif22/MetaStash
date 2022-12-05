class UtcController < ApplicationController
    before_action :active_drop
    before_action :non_active_drop
    def time
        render json: { time: '' + DateTime.now.utc.to_s }, status: :ok
    end
    def test
        @sum=0
        for a in 1..@active_drop.length do
            @sum = @sum + @active_drop[a-1].reward_amount
        end
        @sum2=0
        for a in 1..@non_active_drop.length do
            @sum2 = @sum2 + @non_active_drop[a-1].reward_amount
        end
        render json: {
                            :"Active Drop" => {
                                "total_amount": @sum,
                                "total_drop_locations": @active_drop.length,
                                "data": @active_drop
                            },
                            :"Non-Active Drop" => {
                                "total_amount": @sum2,
                                "total_drop_locations": @non_active_drop.length,
                                "data": @non_active_drop
                            }
                        }, status: :ok
    end
    private
    def active_drop
        @active_drop = Drop.where(is_active: true)
    end
    def non_active_drop
        @non_active_drop = Drop.where(is_active: false)
    end
end