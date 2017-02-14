class ShareRestaurant
	require "net/http"
	require "uri"
 
  	def self.share(contacts, restaurants, current_user)
  		uri =  URI.parse(ENV['FLOCK_URL']+'/chat.sendMessage')
  		header = {'Content-Type': 'text/json'}
		http = Net::HTTP.new(uri.host, uri.port)
		http.use_ssl = true

  		contacts.each do |contact|
			request = Net::HTTP::Post.new(uri.request_uri, header)
			request.body = {  to: 	 contact[:id],
							  text:  'last check !',
							  token: current_user.token
						   }.to_json  		
  			response = http.request(request)
  			raise "Not able to send message !" unless eval(response.body)[:error].blank?
  		end
  	end

end
