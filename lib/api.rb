require 'digest/md5'
require 'httparty'

module Framey
  module Api
    
    # Use this method to fetch updating information about a recording.
    #
    # Example Usage:
    #   Framey::Api.get_video("c96323e0-54b1-012e-9d34-7c6d628c53d4")
    def self.get_video(video_name)
      res = self.make_request("get","/api/videos/#{video_name}")
      return Video.new(res["video"])
    end
    
    # Use this method to delete a recording.
    #
    # Example Usage:
    #   Framey::Api.delete_video("c96323e0-54b1-012e-9d34-7c6d628c53d4")
    def self.delete_video(video_name)
      res = self.make_request("delete","/api/videos/#{video_name}")
      return true
    end
    
    def self.make_request(method,url,params={})
      timestamp, signature = self.sign
      
      params = params.merge({:time_stamp => timestamp, :signature => signature, :api_key => Framey.api_key})
      res = begin
        HTTParty.send(method,Framey::API_HOST + url,{:query => params}) 
      rescue SocketError => e
        nil
      end
      
      parsed_res = res ? res.parsed_response : nil
      
      if !res || parsed_res["success"] == false
        err = nil
        msg = parsed_res ? parsed_res["message"]  : "There was a problem connecting to framey. Please try again."
        
        case res.code
        when 400
          err = BadRequest.new(msg,res.headers)
        when 403
          err = Forbidden.new(msg,res.headers)
        when 404
          err = NotFound.new(msg,res.headers)
        when 500
          err = InternalServerError.new(msg,res.headers)
        else
          err = SocketError.new(msg)
        end
        
        raise err
      end
      
      parsed_res
    end
    
    def self.sign
      timestamp = (Time.now.utc + Framey::API_TIMEOUT * 60).to_i
      signature = Digest::MD5.hexdigest(Framey::SECRET + "&" + timestamp.to_s)
      return timestamp.to_s, signature
    end
    
    class Error < StandardError
      attr_reader :http_headers

      def initialize(message, http_headers={})
        @http_headers = Hash[http_headers]
        super message
      end
    end
      
    # 400
    class BadRequest < Error; end

    # 403
    class Forbidden < Error; end

    # 404
    class NotFound < Error; end

    # 500
    class InternalServerError < Error; end
  end
  
end

