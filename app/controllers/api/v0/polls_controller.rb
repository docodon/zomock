module Api
  module V0
    class PollsController < BaseController
    

    def create
      begin
        poll = Poll.create!(user: @current_user) #create poll
        restaurants = Restaurant.create!( params[:restaurants].map{ |i|  restaurant_params(i,poll) } )
        NotifyPolls.polls(poll[:id], params[:groups], @current_user)
        return render json: {status: true},status: 200
      rescue Exception => e
        return render json: {status: false},status: 422
      end
    end

    def show

    end

    private

    def restaurant_params rest,poll
      {
        poll: poll,
        thumb: rest[:thumb],
        url: rest[:url]
      }
    end

    end
  end
end
