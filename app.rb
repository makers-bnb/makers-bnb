require 'sinatra/base'
require_relative 'app/helpers/users'
require_relative 'lib/request'
require_relative 'lib/space'
require_relative 'lib/user'
require_relative 'lib/connect_to_database'

class MakersBnB < Sinatra::Base
  include Sinatra::UsersHelpers
  enable :sessions

  get '/' do
    erb :index
  end

  get '/spaces/new' do
    @user = current_user
    erb :'spaces/new'
  end

  post '/spaces' do
    user = current_user
    Space.create(name: params[:name],
                 description: params[:description],
                 price: params[:price],
                 start_date: params[:start_date],
                 end_date: params[:end_date],
                 user: user)
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
    @user = current_user
    erb :spaces
  end

  get '/requests/new/:space_id' do
    @space = Space.get(params[:space_id])
    @user = current_user
    erb :"request/new"
  end

  post '/requests' do
    @space = Space.get(params[:space_id])
    @user = current_user
    Request.create(space: @space,
                   user: @user,
                   date: params[:booking_date])
    redirect '/requests'
  end

  get '/requests' do
    @my_requests = Request.all(user_id: session[:user_id])
    my_spaces = Space.all(user_id: session[:user_id])
    @requests_against_my_spaces = Request.all(:space => my_spaces)
    erb :requests
  end

  post '/requests/:req_id' do
    status = params[:status] == 'Accept Booking' ? 'Confirmed' : 'Rejected'
    Request.first(id: params[:req_id]).update(status: status)
    redirect '/requests'
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
    @user = current_user
    erb :'sessions/new'
  end

  run! if app_file == $0
end
