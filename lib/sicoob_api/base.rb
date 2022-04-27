module SicoobApi
	class Base
		require 'uri'
		require 'net/http'
    	require 'net/https'

    	def self.build_request endpoint, metodo, body=nil

      		url = URI("#{SicoobApi.base_uri}/#{endpoint}")

      		http = Net::HTTP.new(url.host, url.port)
      		http.use_ssl = true

      		case metodo
		      when "delete"
		        request = Net::HTTP::Delete.new(url)
		      when "get"
		        request = Net::HTTP::Get.new(url)
		      when "put"
		        request = Net::HTTP::Put.new(url)
		      when "post"
		        request = Net::HTTP::Post.new(url)
		    end

      		request = SicoobApi::Base.default_headers request

      		request.body = body.to_json
      		return http.request(request)
    	end

    	def self.default_headers request
      		request["authorization"] = "Bearer #{SicoobApi::Base.valid_bearer}"
      		request["Content-Type"] = "application/json"
      		request["Client_id"] = "#{SicoobApi.client_id}"
      		return request
    	end

    	def self.get_code

    	end

	    def self.get_token_de_bearer
	    end

	    def self.valid_bearer
	      if SicoobApi.expires_in > DateTime.now
	        return SicoobApi.access_token
	      else
	        SicoobApi::Base.get_token_de_bearer
	        return SicoobApi.access_token
	      end
	    end
	end
end