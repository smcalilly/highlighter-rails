class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]
  include Tagger
  include Markdownable

  def index
    @notes = policy_scope(Note).all
    @no_markdown = no_markdown
  end

  def show
    @markdown = generate_markdown
    @no_markdown = no_markdown
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
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @tags = find_or_create_tags(note_params, current_user.id)
    @note.tags = @tags

    respond_to do |format|
      if @note.update(note_params)
        format.js { }
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
      params.require(:note).permit(:user_id, :body, :content, :tag_list)
    end
end
