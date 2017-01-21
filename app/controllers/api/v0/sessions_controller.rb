module Api
  module V0
    class SessionsController < BaseController

      skip_before_action :set_current_user, only: [:install]

      def install 
        begin
          u = User.where(flock_id: params[:userId]).first
          if u.nil?
            User.create(flock_id: params[:userId],token: params[:token])
          else
            u.token = params[:token]
            u.save!
          end
          return render json: {status: true}, status: 200
        rescue Exception => e
          return render json: {status: false}, status: 422
        end
      end

    def launch
        begin
          @location = @current_user.location
          render status: 200
        rescue Exception => e
          return render json: {status: false},status: 422
        end
    end

    end
  end
end
