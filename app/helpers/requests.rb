require 'sinatra/base'
require_relative '../../lib/request'

module Sinatra
  module RequestsHelpers  
    def booked_dates_string(confirmed_requests)
      return "" if confirmed_requests.length == 0
      return confirmed_requests.map { |request| request.date }.join(" ")
    end
  end

  helpers RequestsHelpers
end