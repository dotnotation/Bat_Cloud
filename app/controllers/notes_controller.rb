class NotesController < ApplicationController
    before_action :find_bat_for_notes, only: [:new, :create, :index]

    def index
        @notes = @bat.notes.all
    end

    def new
        @note = @bat.notes.build
    end

    def create
        @note = @bat.notes.build(note_params)
        if @note.save
            flash[:success] = "Your note has been saved."
            redirect_to bat_path(@bat)
        else
            flash[:danger] = "Something went wrong. Please try again later."
            redirect_to bat_path(@bat)
        end
    end

    private

    def note_params
        params.require(:note).permit(:content, :bat_id, :researcher_id)
    end

    def find_bat_for_notes
        @bat = Bat.friendly.find(params[:bat_id])
    end
end
