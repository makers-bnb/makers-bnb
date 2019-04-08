require 'sinatra/base'
require_relative 'lib/user'
require_relative 'lib/connect_to_database'

class MakersBnB < Sinatra::Base
  enable :sessions
  get '/' do
    erb :index
  end

  post '/user' do
    user = User.create(email: params[:email],
                       password: params[:password])
    session[:user_id] = user.id
    redirect '/spaces'
  end

  get '/spaces' do
    user = User.get(session[:user_id])
    "New account created with email: #{user.email}"
  end

  run! if app_file == $0
end

