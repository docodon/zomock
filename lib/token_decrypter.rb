require 'jwt'

class TokenDecrypter
 
  def self.decode_params(token)
    JWT.decode(token, ENV['APP_SECRET'], true, { :algorithm => 'HS256' })[0]    
  end

end
