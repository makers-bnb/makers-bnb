require 'sinatra/base'
require_relative 'lib/user'
require_relative 'lib/space'
require_relative 'lib/connect_to_database'

class MakersBnB < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces' do
    puts 'inside post /spaces'
    Space.create(name: params[:name], description: params[:description], price: params[:price])
    redirect '/spaces'
  end

  post '/user' do
    user = User.create(email: params[:email],
                       password: params[:password])
    session[:user_id] = user.id
    redirect '/spaces'
  end

  get '/spaces' do
    @spaces = Space.all
    @user = User.get(session[:user_id])
    erb :spaces
  end

  get '/logout' do
    session.clear
    "Goodbye!"
  end 

  run! if app_file == $0
end
