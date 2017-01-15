module Api
  module V0
    class SessionsController < BaseController

      def install 
        begin
          User.where(flock_id: params[:userId],token: params[:token]).first_or_create
          return render json: {status: true}, status: 200
        rescue Exception => e
          return render json: {status: false}, status: 422
        end
      end

    end
  end
end
