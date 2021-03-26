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
  end
    # @user = User.find_by(username: params[:username]
    
    # if params[:username] && params[:email] && params[:password]
    #   if @user
    #     session[:user_id] = @user.id
    #     redirect '/tweet'
    #   end
    #   end
    # end
  


end
