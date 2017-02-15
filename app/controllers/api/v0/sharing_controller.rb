module Api
  module V0
    class SharingController < BaseController
    

    def share_restaurants
      begin
      	ShareRestaurant.share(params[:contacts],params[:restaurants], @current_user)
      	return render json: {status: true},status: 200
      rescue Exception => e
        binding.pry
      	return render json: {status: false},status: 422
      end
    end

    end
  end
end
