module Api
  module V0
    class LocationsController < BaseController

    def update
        begin
          loc = Location.where(user_id: @current_user.id).first
          @location = Location.update(@current_user.id,loc_params) unless loc.nil?
          @location = Location.create(loc_params.merge({user_id: @current_user.id})) if loc.nil?
          render status: 200 
        rescue Exception => e
          return render json: {status: false},status: 422
        end
    end


    private

    def loc_params
      params.require(:location_details).permit(:entity_type, :entity_id, :title, :latitude, 
        :longitude, :city_id, :city_name, :country_id, :country_name, :result)
    end

    end
  end
end
