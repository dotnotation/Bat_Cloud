class SessionsController < ApplicationController

    def new
    end

    def create
        @researcher = Researcher.find_by(email: params[:email])
        if @researcher && researcher.authenticate(params[:password])
            session[:researcher_id] = @researcher.id 
            flash[:success] = "Welcome #{@researcher.name}! You are now logged in."
            redirect_to bats_path
        else
            flash[:danger] = "Login failed"
            render :new
        end
    end

    def delete
        session.clear
        redirect_to login_path
    end
end
