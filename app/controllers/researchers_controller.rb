class ResearchersController < ApplicationController
    before_action :researcher_authorization, only: [:edit, :update, :destroy]
    before_action :find_researcher, only: [:show]

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
            flash[:danger] = "#{@researcher.errors.full_messages.join(", ")}"
            render :new
        end
    end

    def edit
        if @researcher == current_researcher || admin?
            render :edit
        else
            flash[:danger] = "You are not authorized to make changes to this account."
            redirect_to bats_path
        end
    end

    def update
        if @researcher.update(researcher_params)
            flash[:success] = "Your account has been updated."
            redirect_to researcher_path
        else
            flash[:danger] = "#{@researcher.errors.full_messages.join(", ")}"
            render :edit
        end
    end
    
    def destroy
        if @researcher == current_researcher || admin?
            @researcher.destroy
            session.delete[:researcher_id]
            flash[:sucess] = "Your account has been deleted. We are sorry to see you go."
            redirect_to root_path
        else
            flash[:danger] = "Something went wrong. Please try again later."
            redirect_to bats_path
        end
    end

    private

    def researcher_params
        params.require(:researcher).permit(:name, :email, :password, :address, :phone_number, :organization_id, :organization_name, :access)
    end

    def find_researcher
        @researcher = Researcher.friendly.find(params[:id])
    end

    def researcher_authorization
        find_researcher
        if @researcher.id != session[:researcher_id] || !admin?
            flash[:danger] = "You are not authorized to make changes to this account"
            redirect_to bats_path 
        end
    end
end
