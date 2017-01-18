module Api
  module V0
    class SessionsController < BaseController

      skip_before_action :set_current_user, only: [:install]

      def install 
        begin
          User.where(flock_id: params[:userId],token: params[:token]).first_or_create
          return render json: {status: true}, status: 200
        rescue Exception => e
          return render json: {status: false}, status: 422
        end
      end

    def launch
        begin
          raise "" if @current_user.nil?
          return render json: {status: true},status: 200 
        rescue Exception => e
          return render json: {status: false},status: 422
        end
    end

    end
  end
end

{"entity_type":"city","entity_id":1,"title":"Delhi NCR","latitude":28.625789,
"longitude":77.210276,"city_id":1,"city_name":"Delhi NCR","country_id":1,
"country_name":"India"}