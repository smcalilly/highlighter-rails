class HighlightsController < ApplicationController
  before_action :set_highlight, only: [:show, :edit, :update, :destroy]
  wrap_parameters format: [:json]
  include Tagger

  def index
    @highlights = policy_scope(Highlight.order(created_at: :desc))
  end

  def show
    
  end

  def current
    if params[:url]
      @highlight = policy_scope(Highlight).where(:url => params[:url]).all
      respond_to do |format|
        format.json { render json: @highlight, status: :ok}
      end
      
    end
  end

  def new
    @highlight = Highlight.new
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
      params.require(:highlight).permit(:text, :url, :tag_list)
    end

    def create_highlight
      @highlight = Highlight.new(highlight_params)
      @highlight.user = current_user

      source_params = {
        user_id: current_user.id,
        location: highlight_params[:url],
        title: highlight_params[:url]
      }

      @source = Source.find_or_create_by(source_params)
      authorize @source      
      @highlight.source = @source

      if highlight_params[:tag_list]
        @tags = find_or_create_tags(highlight_params, current_user.id)
        @highlight.tags = @tags
      end
      
      
      
      authorize @highlight
    end
end
