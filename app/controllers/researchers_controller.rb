class ResearchersController < ApplicationController
    def index
        @researchers = Researcher.all
    end

    def show
        find_researcher
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

    end

    def update
    end
    
    def destroy
    end

    private

    def researcher_params
        params.require(:user).permit(:name, :email, :password, :address, :phone_number, :organization_id, :organization_name, :access)
    end

    def find_researcher
        @researcher = Researcher.friendly.find(params[:id])
    end
end
