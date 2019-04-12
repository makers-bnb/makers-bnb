require 'sinatra/base'

module Sinatra
  module FilterHelpers
    def generate_filter_message
      if (session[:start_date].nil? || session[:start_date].empty?) && (session[:end_date].nil? || session[:end_date].empty?)
        nil
      elsif session[:start_date].nil? || session[:start_date].empty?
        "Showing spaces available up to #{readable_date(session[:end_date])}"
      elsif session[:end_date].nil? || session[:end_date].empty?
        "Showing spaces available from #{readable_date(session[:start_date])}"
      else
        "Showing spaces available between #{readable_date(session[:start_date])} and #{readable_date(session[:end_date])}"
      end
    end

    def readable_date(date_string)
      date = Date.strptime(date_string, "%Y-%m-%d")
      date.strftime("%A, %d %b %Y")
    end
  end

  helpers FilterHelpers
end
