class Helpers 

    def self.current_user(sessions_hash)
        @id = sessions_hash[:user_id]
        if @id
          
            User.find_by(id: @id)
           
        end
    end

    def self.is_logged_in?(sessions_hash)
      !!sessions_hash[:user_id] # this is almost lika nd if satmenet,  to see if sessions exists,  returns tru, if it exsits
        
        
    end
end