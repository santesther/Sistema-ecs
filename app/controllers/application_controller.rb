class ApplicationController < ActionController::Base
  include ActiveStorage::SetCurrent
  

    protected

     def after_sign_in_path_for(current_user)
       welcome_path
     end

    def after_sign_up_path_for(current_user)
        new_user_session_path	
    end

end
