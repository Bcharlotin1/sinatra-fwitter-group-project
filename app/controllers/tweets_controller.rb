class TweetsController < ApplicationController

    get '/tweets' do 
        @tweets = Tweet.all
        
        if Helpers.is_logged_in?(session)
            erb :"/tweets/tweets"
        else
            redirect "/login"
        end
    end

end
