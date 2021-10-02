class ApplicationController < ActionController::Base
    include ApplicationHelper

    private 

    def redirect_if_not_logged_in
        if !logged_in?
            flash[:danger] = "You must be logged in."
            redirect_to login_path 
        end
    end

    def redirect_if_logged_in 
        if logged_in?
            redirect_to bats_path 
        end
    end
end
