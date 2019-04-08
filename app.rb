require 'sinatra/base'

class MakersBnB < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces/new' do
    session[:name] = params[:name]
    session[:description] = params[:description]
    session[:price] = params[:price]
    redirect '/spaces'
  end

  get '/spaces' do
    @name = session[:name]
    @description = session[:description]
    @price = session[:price]
    erb :spaces
  end

  run! if app_file == $0
end
