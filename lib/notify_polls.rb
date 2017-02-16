class NotifyPolls
	require "net/http"
	require "uri"
 
  	def self.polls(poll_id, groups, current_user)
  		uri =  URI.parse(ENV['FLOCK_URL']+'/chat.sendMessage')
  		header = {'Content-Type': 'text/json'}
		  http = Net::HTTP.new(uri.host, uri.port)
		  http.use_ssl = true
  		groups.each do |group|
			  request = Net::HTTP::Post.new(uri.request_uri, header)
			  request.body = {  to: 	       group[:id],
				  			          text:        "polls @zomock",
				  			          token:       current_user.token,
                          attachments: widget(poll_id)
				  		         }.to_json  		
  			response = http.request(request)
  			raise "Not able to send message !" unless eval(response.body)[:error].blank?
  		end
  	end

  	private

  	def self.widget poll_id
  		[{
        title: 'Zomock poll',
        description: 'via Zomock',
        views: {
                widget: { src: ENV["POLL_URL"].to_s+'/api/v0/polls/'+poll_id.to_s, width: 380, height: 200 }
        }
  		}].to_json
  	end

end
