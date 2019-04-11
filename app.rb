require 'pony'
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'app/helpers/users'
require_relative 'app/helpers/requests'
require_relative 'lib/request'
require_relative 'lib/space'
require_relative 'lib/user'
require_relative 'app/connect_to_database'

class MakersBnB < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash
  include Sinatra::UsersHelpers
  include Sinatra::RequestsHelpers

  get '/' do
    erb :index
  end

  get '/spaces/new' do
    @user = current_user
    erb :'spaces/new'
  end

  post '/spaces' do
    user = current_user
    space = Space.create(name: params[:name],
                         description: params[:description],
                         price: params[:price],
                         start_date: params[:start_date],
                         end_date: params[:end_date],
                         user: user)
    if space.id.nil?
      flash[:danger] = "Could not create listing. All fields are required."
      redirect '/spaces/new'
    else
      flash[:success] = "New listing created."
    end
    redirect '/spaces'
  end

  post '/user' do
    if params[:email] == '' || params[:password] == ''
      flash[:danger] = "Could not create user. All fields are required."
      redirect '/'
    end
    user = User.create(email: params[:email],
                       password: params[:password])
    if user.id.nil?
      flash[:danger] = "User already exists. Have you forgotten your password? "\
                       "Can't help you with that, sorry :("
      redirect '/'
    end
    session[:user_id] = user.id
    flash[:success] = "Hello #{user.email}."
    redirect '/spaces'
  end

  get '/spaces' do
    @spaces = Space.all
    @user = current_user
    erb :spaces
  end

  get '/requests/new/:space_id' do
    @space = Space.get(params[:space_id])
    @confirmed_requests = Request.all(status: 'Confirmed',
                                      space_id: params[:space_id])
    @booked_dates = Request.all(status: 'Confirmed',
                                space_id: params[:space_id])
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
    status = params[:status] == 'Accept booking' ? 'Confirmed' : 'Rejected'
    Request.first(id: params[:req_id]).update(status: status)
    redirect '/requests'
  end

  delete '/sessions' do
    session.clear
    redirect '/sessions/new'
  end

  post '/sessions' do
    user = User.log_in(params[:email], params[:password])
    if user.nil?
      flash[:danger] = "Invalid login details."
      redirect '/sessions/new'
    else
      session[:user_id] = user.id
      flash[:success] = "Hello #{user.email}."
      redirect '/spaces'
    end
  end

  get '/sessions/new' do
    @user = current_user
    erb :'sessions/new'
  end

  get '/email' do
    Pony.mail :to => params[:recommendee],
              :from => 'recommendation@makersbnb.co.uk',
              :subject => 'Welcome to Makers B&B',
              :body => "Good day, your friend #{params[:recommender]} has seen something on our site and thought it might be of interest to you!
              At Makers B&B we specialise in listing incredible holiday flats around which you can build the trip of a lifetime.

              So check us out at www.makersbnb.co.uk.

              We look forward to your visit"
    redirect '/spaces'
  end

  run! if app_file == $0
end
