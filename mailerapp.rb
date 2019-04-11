get '/email' do
  Pony.mail :to => params[:recommendee],
            :from => "recommendation@makersbnb.co.uk",
            :subject => "Welcome to Makers B&B!",
            :body => erb(:email)
end
