require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get "/" do
    erb :index
  end

  get '/signup' do 
    erb :signup
  end

  post '/signup' do 
    
    if params[:username] && params[:email] && params[:password]
      @new_user = User.new(username: params[:username], email: params[:email], password: params[:password])
      @new_user.save
      session[:user_id] = @new_user.id
      redirect '/tweets'
    end
    

  end

  
    # @user = User.find_by(username: params[:username])
    
   


end
