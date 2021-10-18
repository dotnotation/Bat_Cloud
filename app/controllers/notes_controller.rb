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
        @note.researcher_id = current_researcher.id
        if @note.save
            flash[:success] = "Your note has been saved."
            redirect_to bat_path(@bat)
        else
            render :new
        end
    end

    private

    def note_params
        params.require(:note).permit(:content)
    end

    def find_bat_for_notes
        @bat = Bat.friendly.find(params[:bat_id])
    end
end
