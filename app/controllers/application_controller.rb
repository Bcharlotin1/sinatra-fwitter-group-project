require './config/environment'
# require "rack-flash"
class ApplicationController < Sinatra::Base
  # use Rack::Flash

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions 
    set :session_secret, "secret"
  end

  get "/" do
    erb :index
  end

  get '/signup' do 
    if !Helpers.is_logged_in?(session)
        erb :signup
    else
      redirect '/tweets'
    end
  end

  post '/signup' do 
    
    if params[:username]!= "" && params[:email] != "" && params[:password] != ""
  

      @new_user = User.create(username: params[:username], email: params[:email], password: params[:password])
      session[:user_id] = @new_user.id
      redirect '/tweets'
    else
      # flash[:message] = "Please enter ALL feilds."
      redirect to '/signup'
    end
    

  end

  
 
    
   


end
