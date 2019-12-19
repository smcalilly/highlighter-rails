class HighlightsController < ApplicationController
  before_action :set_highlight, only: [:show, :edit, :update, :destroy]
  wrap_parameters format: [:json]

  def index
    @highlights = policy_scope(Highlight)
    authorize @highlights
  end

  def show
    authorize @highlight
  end

  def new
    @highlight = Highlight.new
    authorize @highlight
  end

  def edit
  end

  def create
    @highlight = create_highlight

    respond_to do |format|
      if @highlight.save
        format.html { redirect_to @highlight, notice: 'Highlight was successfully created.' }
        format.json { render :show, status: :created, location: @highlight }
      else
        format.html { render :new, flash: 'Failure' }
        format.json { render json: @highlight.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @highlight.update(highlight_params)
        format.html { redirect_to @highlight, notice: 'Highlight was successfully updated.' }
        format.json { render :show, status: :ok, location: @highlight }
      else
        format.html { render :edit }
        format.json { render json: @highlight.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @highlight.destroy
    authorize @highlight

    respond_to do |format|
      format.html { redirect_to highlights_url, notice: 'Highlight was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_highlight
      @highlight = policy_scope(Highlight).find(params[:id])

    rescue
      redirect_to highlights_path, notice: "that highlight doesn't exist."
    end

    def highlight_params
      params.require(:highlight).permit(:text, :url, :source_id)
    end

    def create_highlight
      source_params = {
        user_id: current_user.id,
        location: highlight_params[:url],
        title: highlight_params[:url]
      }

      @source = Source.find_or_create_by(source_params)
      authorize @source
  
      @highlight = Highlight.new(highlight_params)
      @highlight.user = current_user
      @highlight.source = @source
      authorize @highlight
    end
end
