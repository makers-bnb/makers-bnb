require 'sinatra/base'
require_relative 'lib/request'
require_relative 'lib/space'
require_relative 'lib/user'
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
    Space.create(name: params[:name],
                 description: params[:description],
                 price: params[:price])
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

  get '/requests/new/:id' do
    @space = Space.get(params[:id])
    @user = User.get(session[:user_id])
    erb :"request/new"
  end

  post '/requests' do
    @space = Space.get(params[:space_id])
    @user = User.get(session[:user_id])
    Request.create(space: @space,
                   user: @user,
                   date: params[:booking_date])
    redirect '/requests'
  end

  get '/requests' do
    @requests = Request.all(user_id: session[:user_id])
    erb :requests
  end

  get '/logout' do
    session.clear
    redirect '/sessions/new'
  end

  post '/sessions' do
    user = User.log_in(params[:email], params[:password])
    if user.nil?
      redirect '/sessions/new'
    else
      session[:user_id] = user.id
      redirect '/spaces'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  run! if app_file == $0
end
