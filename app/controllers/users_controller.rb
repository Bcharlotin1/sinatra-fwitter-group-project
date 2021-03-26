class UsersController < ApplicationController

    get "/login"  do 
        if !Helpers.is_logged_in?(session)
            erb :"/users/login"
        else 
            redirect "/tweets"
        end
    end

    post "/login" do 
        # binding.pry
        @user = User.find_by(username: params[:username])
        
        if @user
            session[:user_id] = @user.id
            redirect '/tweets'
        else
            # erb :error
        end
    end

    get '/logout' do
        session.clear
        redirect '/login'
    
    end

    
end
