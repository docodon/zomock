module Api
  module V0
    class LocationsController < BaseController
    
    require 'open-uri'

    def update
        begin
          loc = Location.where(user_id: @current_user.id).first
          @location = Location.update(@current_user.location.id, loc_params) unless loc.nil?
          @location = Location.create(loc_params.merge({user_id: @current_user.id})) if loc.nil?
          render status: 200 
        rescue Exception => e
          return render json: {status: false},status: 422
        end
    end


    def menu_images  #wip
      doc = Nokogiri::HTML(params[:url])
      doc.xpath('//*[@id="tabtop"]/div/script')
    end

    private

    def loc_params
      params.require(:location_details).permit(:entity_type, :entity_id, :title, :latitude, 
        :longitude, :city_id, :city_name, :country_id, :country_name)
    end

    end
  end
end
