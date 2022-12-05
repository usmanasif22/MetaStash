class VotesController < ApplicationController
    def castvote
        @user = User.find_by_id(params[:player_id])
        if @user.nil?
            render json: {
                message: "Invalid User Id",
                status: 404
            }, status: :ok
        elsif @user.payment_status == false
            render json: {
                message: "Please Subscribe to cast vote",
                status: 401
            }, status: :ok
        else
            @ngo_id = Ngo.find_by_id(params[:ngo_id])
            if @ngo_id.nil?
                render json: {
                    message: "Invalid Ngo Id",
                    status: 404
                }, status: :ok
            elsif @user.vote_casted == true
                render json: {
                    message: "user Already Voted",
                    status: 402
                }, status: :ok
            elsif @user.vote_casted == false
                @poll_id_1 = Poll.find_by_ngo_id_1_id(params[:ngo_id])
                @poll_id_2 = Poll.find_by_ngo_id_2_id(params[:ngo_id])
                @poll_id_3 = Poll.find_by_ngo_id_3_id(params[:ngo_id])
                @poll_id_4 = Poll.find_by_ngo_id_4_id(params[:ngo_id])
                if @poll_id_1.present?
                    user_voted
                    @poll_id_1.ngo_1_votes = @poll_id_1.ngo_1_votes + 1
                    @poll_id_1.save
                    render json: {
                        message: "Voted for Ngo Id 1",
                        status: 200
                    }, status: :ok
                elsif @poll_id_2.present?
                    user_voted
                    @poll_id_2.ngo_2_votes = @poll_id_2.ngo_2_votes + 1
                    @poll_id_2.save
                    render json: {
                        message: "Voted for Ngo Id 2",
                        status: 200
                    }, status: :ok
                elsif @poll_id_3.present?
                    user_voted
                    @poll_id_3.ngo_3_votes = @poll_id_3.ngo_3_votes + 1
                    @poll_id_3.save
                    render json: {
                        message: "Voted for Ngo Id 3",
                        status: 200
                    }, status: :ok
                elsif @poll_id_4.present?
                    user_voted
                    @poll_id_4.ngo_4_votes = @poll_id_4.ngo_4_votes + 1
                    @poll_id_4.save
                    render json: {
                        message: "Voted for Ngo Id 4",
                        status: 200
                    }, status: :ok
                else
                    render json: {
                        message: "No Ngo Id found in Poll",
                        status: 404
                    }, status: :ok
                end
            end
        end
    end
    private
    def user_voted
        @user.vote_casted=true
        @user.save
    end
end