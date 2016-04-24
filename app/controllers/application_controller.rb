class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception


  def to_inchs(cms)
    inchs = cms/2.54
    return inchs.round(2)
    # multiple = 1
    # res = []
    # while multiple <= 64 do
    #     res.push((inchs/multiple).floor)
    #     multiple *= 2
    #     inchs -= (inchs/multiple).floor
    # end
    # puts "====>"+res.count.to_s
    # size = res.count
    # (0..(size-1)).each do |i|
    #   return res.slice!(7-i) and break if((res[6-i] != 0) && (res[7-i] == 0))
    # end 
  end

     before_filter :authenticate
  		protected
		    def authenticate
		      authenticate_or_request_with_http_basic do |username, password|
		      username == "michel" && password == "newyork"
		      username == "marie" && password == "losserand"
		    end
  		end
end
