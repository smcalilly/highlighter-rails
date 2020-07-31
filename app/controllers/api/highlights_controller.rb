class Api::HighlightsController < Api::ApiBaseController
  include Highlightable
  wrap_parameters format: [:json]

  def create
    @highlight = create_highlight

    respond_to do |format|
      if @highlight.save
        format.json { render status: :created, json: @highlight.to_json }
      else
        format.json { render json: @highlight.errors, status: :unprocessable_entity }
      end
    end
  end

  def current
    if params[:url]
      @highlight = policy_scope(Highlight).where(:url => params[:url]).all
      respond_to do |format|
        format.json { render json: @highlight, status: :ok}
      end
    end
  end
end