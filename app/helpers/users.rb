require 'sinatra/base'

module Sinatra
  module UsersHelpers  
    def logged_in?
      !not_logged_in?
    end

    def not_logged_in?
      session[:user_id].nil?
    end

    def current_user
      User.get(session[:user_id])
    end
  end

  helpers UsersHelpers
end
