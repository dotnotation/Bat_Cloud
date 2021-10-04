class BatsController < ApplicationController
    before_action :find_bat, only: [:show, :edit, :update, :destroy]
    before_action :bat_authorization, only: [:edit, :update, :destroy]

    def index
        @bats = Bat.all 
    end

    def new
        @bat = Bat.new 
    end

    def create
        @bat = Bat.new(bat_params)
        if @bat.save
            flash[:success] = "Your bat has been logged."
            redirect_to bat_path(@bat)
        else
            flash[:danger] = "#{@bat.errors.full_messages.join(", ")}"
            render :new
        end
    end

    def show
        @notes = @bat.notes
        @note = Note.new(researcher_id: current_researcher.id)
    end

    def edit

    end

    def update
        if @bat.update(bat_params)
            flash[:success] = "Your bat has been updated."
            redirect_to bat_path(@bat)
        else
            flash[:danger] = "#{@bat.errors.full_messages.join(", ")}"
            render :edit
        end
    end
    
    def destroy
        if admin?
            @bat.destroy
            flash[:sucess] = "This bat has been removed from the database."
            redirect_to bats_path
        else
            flash[:danger] = "Something went wrong. Please try again later."
            render :edit
        end
    end

    private

    def bat_params
        params.require(:bat).permit(:tag_number, :nickname, :species, :date_found, :location, :date_last_seen, 
                :weight, :age, :sex, :wing_span, :colony_size, :conservation_status, :white_nose_syndrome, :discoverer_id)
    end

    def find_bat
        @bat = Bat.friendly.find(params[:id])
    end

    def bat_authorization
        find_bat
        if @bat.discoverer_id != session[:researcher_id] || !admin?
            flash[:error] = "You are not authorized to make changes to this bat."
            redirect_to bats_path
        end
    end
end
