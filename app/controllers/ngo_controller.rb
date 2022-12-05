class NgoController < ApplicationController
    def index
        @ngos = Ngo.all 
        
        if @ngos.present?
            @nog = @ngos.to_json(:only => [:id, :name])
            render json: {status:200, data: JSON.parse(@nog)}, status: :ok
        else
            render json: {message:"No Ngo's available",status:404}, status: :ok
        end
    end 
end