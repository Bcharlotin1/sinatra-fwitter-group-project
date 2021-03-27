class TweetsController < ApplicationController

    get '/tweets' do 
        if Helpers.is_logged_in?(session)
            @user = Helpers.current_user(session)
            @tweets = Tweet.all

            # binding.pry
                erb :"/tweets/tweets"
        else
            redirect "/login"
        end
    end

    post "/tweets" do 
        if params[:content] != ""
            @new_tweet = Tweet.create(content: params[:content])
            @user = User.find(params[:user_id])
            @user.tweets << @new_tweet
            @user.save
            

        else
            redirect "/tweets/new"
        end
     
    end
    get "/tweets/new" do 
        if Helpers.is_logged_in?(session)
            @user = Helpers.current_user(session)
            erb :"/tweets/new"
        else
            redirect "/login"
        end
    end

    get '/tweets/:id/edit' do
        @tweet = Tweet.find(params[:id])
        
        if Helpers.is_logged_in?(session)
            if Helpers.current_user(session).id == @tweet.user_id
                erb  :"/tweets/edit_tweet"
            else
                redirect "/tweets"
            end
        
        else   
            redirect "/login"
        end
    
    end

    patch '/tweets/:id' do
        @tweet = Tweet.find_by_id(params[:id])
        
        if Helpers.is_logged_in?(session)
            if params[:content] != ""
                @tweet.update(content: params[:content])
                redirect "/tweets/#{@tweet.id}"
            else
      
                redirect "/tweets/#{@tweet.id}/edit"
            end
        else
            redirect "/login"
        end
      end
      

    get "/tweets/:id" do
        @tweet = Tweet.find_by_id(params[:id]) 
        
        if Helpers.is_logged_in?(session)
            @tweet = Tweet.find_by_id(params[:id]) 
            erb :"/tweets/show_tweet"
        else
          redirect "/login"
        end
    end

    delete '/tweets/:id' do
        @tweet = Tweet.find_by_id(params[:id])
        
        if Helpers.is_logged_in?(session)
            if Helpers.current_user(session).id == @tweet.user_id
                @tweet.delete
                redirect to '/tweets'
            end
        else
            redirect "/login"
        end
    end

end
