require 'sinatra/base'

class MakersBnB < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/user' do
    # in here is where the user gets created
    redirect '/somewhere'
  end

  get '/somewhere' do
    "New account created"
  end

  run! if app_file == $0
end
