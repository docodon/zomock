module Api
  module V0
    class PollsController < BaseController

    skip_before_action :set_current_user, only: [:show, :vote_restaurant]
    before_action :set_guest_user, only: [:show, :vote_restaurant]
    after_action :allow_flock, only: [:show]

    layout false

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
      begin
        @poll = Poll.find(params[:id])
        @restaurants = @poll.restaurants
        @users_voted = RestaurantPoll.where(poll: @poll).all
        @vote_count = {}
        @current_user_voted = []
        @restaurants.each do |i|
          @vote_count[i] = 0
        end
        @users_voted.each do |i|
          @vote_count[i.restaurant]+=1
          @current_user_voted.push(i.restaurant_id) if i[:flock_user]==@guest_user
        end
        @vote_count_ar = @vote_count.map { |i| [i[0].name, i[1], 
                                                i[0].thumb, i[0].location, 
                                                i[0].id, i[0].url ]    
                                         }.to_json
        raise "something wrong !" if @current_user_voted.length>1
        if params[:json].to_i==1
          return render json: {poll_id: @poll.id,
                               results: @vote_count_ar,
                               current_user_vote: @current_user_voted[0],
                               total_votes: @users_voted.length
                              }
        end
      rescue Exception => e
        return render json: {message: 'Page not found !'},status: 422
      end
    end

    def vote_restaurant
      begin
        poll = RestaurantPoll.where(poll_id: params[:id], flock_user: @guest_user).first
        poll.destroy unless poll.blank?
        RestaurantPoll.create!(poll_id: params[:id],
                               restaurant_id: params[:id2], flock_user: @guest_user)
        return render json: {status: true},status: 200
      rescue Exception => e
        return render json: {status: false},status: 422
      end
    end


    private

    def restaurant_params rest,poll
      {
        poll: poll,
        thumb: rest[:thumb],
        url: rest[:url],
        location: rest[:location][:locality_verbose],
        name: rest[:name]
      }
    end


    def set_guest_user
      begin
        @guest_user = eval(params[:flockEvent])[:userId]
      rescue
        @guest_user = params[:user_id]
        return render status: 422 if @guest_user.blank?
      end
    end  
  
    def allow_flock
      response.headers['X-Frame-Options'] = 'ALLOWALL'
    end

    end
  end
end
