class BatsController < ApplicationController
    before_action :redirect_if_not_logged_in, only: [:new, :create, :edit, :update, :destroy]
    before_action :find_bat, only: [:show, :edit, :update, :destroy]

    def index
        @bats = Bat.all 
    end

    def search
        @bats = Bat.search(params[:tag_number])
        render :index
    end

    def recently_discovered
        @bats = Bat.recently_discovered.limit(10)
    end

    def alphabetized_bats
        @bats = Bat.alphabetized_bats
        render :index
    end

    def new
        @bat = Bat.new 
    end

    def create
        @bat = Bat.new(bat_params)
        @bat.discoverer_id = current_researcher.id
        if @bat.save
            flash[:success] = "Your bat has been logged."
            redirect_to bat_path(@bat)
        else
            render :new
        end
    end

    def show
        @notes = @bat.notes
        if logged_in?
            @note = Note.new(researcher_id: current_researcher.id)
        else
            flash[:message] = "Please log in to see notes about this bat."
        end
    end

    def edit
        if @bat.discoverer_id == session[:researcher_id] || admin?
            render :edit
        else
            flash[:danger] = "You are not authorized to make changes to this bat."
            redirect_to bats_path
        end

    end

    def update
        if @bat.update(bat_params)
            flash[:success] = "Your bat has been updated."
            redirect_to bat_path(@bat)
        else
            render :edit
        end
    end
    
    def destroy
        if @bat.discoverer_id == session[:researcher_id] || admin?
            @bat.destroy
            flash[:success] = "This bat has been removed from the database."
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

end
