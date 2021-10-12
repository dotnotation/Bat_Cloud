class ResearchersController < ApplicationController
    before_action :redirect_if_not_logged_in, only: [:index, :edit, :update, :destroy]
    before_action :redirect_if_logged_in, only: [:new, :create]
    before_action :find_researcher, only: [:show, :destroy, :edit, :update]

    def index
        @researchers = Researcher.all
    end

    def show
    end

    def new
        @researcher = Researcher.new 
    end

    def create
        @researcher = Researcher.new(researcher_params)
        if @researcher.save
            flash[:success] = "Your account has been created."
            session[:researcher_id] = @researcher.id 
            redirect_to bats_path
        else
            render :new
        end
    end

    def edit
        if @researcher.id == session[:researcher_id] || admin?
            render :edit
        else
            flash[:danger] = "You are not authorized to make changes to this account"
            redirect_to bats_path 
        end
    end

    def update
        if @researcher.update(researcher_params)
            flash[:success] = "Your account has been updated."
            redirect_to researcher_path
        else
            render :edit
        end
    end
    
    def destroy
        # byebug
        if current_researcher || admin?
            @researcher.destroy
            flash[:sucess] = "Your account has been deleted. We are sorry to see you go."
            if admin? 
                redirect_to bats_path
            else
                session[:researcher_id] = nil
                redirect_to root_path
            end
        else
            flash[:danger] = "Something went wrong. Please try again later."
            redirect_to bats_path
        end
    end

    private

    def researcher_params
        params.require(:researcher).permit(:name, :email, :password, :address, :phone_number, :organization_name, :access)
    end

    def find_researcher
        @researcher = Researcher.friendly.find(params[:id])
    end

end
