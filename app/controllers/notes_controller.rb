class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]
  include Tagger

  def index
    @notes = policy_scope(Note).all
  end

  def show
  end

  def new
    @note = Note.new
  end

  def edit
  end

  def create
    @note = create_note

    respond_to do |format|
      if @note.save
        format.html { redirect_to @note, notice: 'Note was successfully created.' }
        format.json { render :show, status: :created, location: @note }
      else
        puts 'error'
        puts @note.errors.inspect
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to @note, notice: 'Note was successfully updated.' }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_url, notice: 'Note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_note
      @note = policy_scope(Note).find(params[:id])
    rescue
      redirect_to notes_path, notice: "that highlight doesn't exist."
    end

    # i don't know how else to add the user id to a callback in the note model
    def create_note
      @tags = find_or_create_tags(note_params, current_user.id)
  
      @note = Note.new(note_params)
      @note.user = current_user
      @note.tags = @tags
      authorize @note
      return @note
    end

    # Only allow a list of trusted parameters through.
    def note_params
      params.require(:note).permit(:user_id, :body, :tag_list)
    end
end
