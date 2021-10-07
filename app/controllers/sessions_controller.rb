class SessionsController < ApplicationController

    def new
    end

    def create
        @researcher = Researcher.find_by(email: params[:researcher][:email])
        if @researcher && @researcher.authenticate(params[:researcher][:password])
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

    def omniauth
        byebug
        @researcher = Researcher.find_or_create_by(email: auth[:info][:email]) do |r|
            r.email = auth[:info][:email]
            r.name = auth[:info][:name]
            r.uid = auth[:uid]
            r.provider = auth[:provider]
            r.password = SecureRandom.hex(64)
        end

        if @researcher.valid?
            session[:researcher_id] = researcher.id 
            redirect_to bats_path
        else
            flash[:danger] = "Incorrect login. Please try again."
            redirect_to login_path
        end       
    end

    private

    def auth
        request.env['omniauth.auth']
    end
end
