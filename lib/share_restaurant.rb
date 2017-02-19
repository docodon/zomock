class ShareRestaurant
	require "net/http"
	require "uri"
 
  	def self.share(contacts, restaurants, current_user)
  		uri =  URI.parse(ENV['FLOCK_URL']+'/chat.sendMessage')
  		header = {'Content-Type'=> 'text/json'}
		  http = Net::HTTP.new(uri.host, uri.port)
		  http.use_ssl = true

  		contacts.each do |contact|
			request = Net::HTTP::Post.new(uri.request_uri, header)
			request.body = {  to: 	       contact[:id],
							          text:        'how about this !',
							          token:       current_user.token,
						   	        attachments: self.generate_html(restaurants)
						         }.to_json  		
  			response = http.request(request)
  			raise "Not able to send message !" unless eval(response.body)[:error].blank?
  		end
  	end


  	private

  	def self.generate_html(restaurants)
  		[{
			"title"=> "Restaurants",
			"description"=> "via Zomock",
			 "views"=> {
        		"html"=> { 
        			"inline"=> generate_div(restaurants), 
        			"width"=> 400,
        			"height"=> 300 
        		}
    		}
  		}].to_json
  	end

  	def self.generate_div(restaurants)
  		s='<html><body><div style="overflow-y: scroll;overflow-x:hidden;">'
  		restaurants.each_with_index do |i,j|
  			s+="<div style='height:auto;width:320;padding-bottom:10px;margin-right:10px;margin-left:10px;'>
              <img src='#{ i[:thumb].blank? ? ENV['POLL_URL']+'/place_holder.png' : i[:thumb] }' style='width:240px;height:180px;margin-left:10px;margin-right:0px;border-radius:15px'></img>
  	   				<p style='font-family:Monospace;'>
                <p style='display:inline;color:#CB202D;'><b>#{i[:name]}</b></p>
                 at #{i[:location][:locality_verbose]}<br> Rated #{i[:user_rating][:aggregate_rating]} with
                expected expense #{i[:currency]+i[:average_cost_for_two].to_s}.<br>
                Check it out at <a href='#{i[:url]}' target='_blank'>Zomato</a>
                #{ (j==restaurants.length-1) ? '' : '<hr>'}
              </p>
    			</div>"
  		end
  		s+="</div></body></html>"
  		s
  	end


end
