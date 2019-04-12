require 'sinatra/base'
require_relative '../../lib/request'

module Sinatra
  module RequestsHelpers  
    def booked_dates_string(confirmed_requests)
      return "" if confirmed_requests.length.zero?

      return confirmed_requests.sort.map { |request| request.date }.join(" ")
    end
  end

  helpers RequestsHelpers
end
