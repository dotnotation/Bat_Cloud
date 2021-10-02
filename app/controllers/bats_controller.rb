class BatsController < ApplicationController
    before_action :find_bat, only: [:show]

    def index
        @bats = Bat.all 
    end

    def show
    end

    private

    def find_bat
        @bat = Bat.friendly.find(params[:id])
    end

    def bat_authorization
        find_bat
        if @bat.researcher_id != session[:researcher_id] || !admin?
            flash[:error] = "You are not authorized to make changes to this bat."
            redirect "/bats"
        end
    end
end
