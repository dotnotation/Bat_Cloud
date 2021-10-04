class NotesController < ApplicationController

    def create
        # byebug
        @bat = Bat.friendly.find(params[:bat_id])
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
end
