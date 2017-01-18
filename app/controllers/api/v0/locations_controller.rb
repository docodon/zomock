module Api
  module V0
    class LocationsController < BaseController

    def update
        begin
          raise "" if @current_user.nil?
          loc = Location.where(user_id: @current_user.id).first
          Location.where(user_id: @current_user.id).update(loc_params) unless loc.nil?
          Location.create(loc_params.merge({user_id: @current_user.id})) if loc.nil?
          return render json: {status: true},status: 200 
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
