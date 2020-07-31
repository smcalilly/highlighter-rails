module Highlightable
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

  def highlight_params
    params.require(:highlight).permit(:text, :url, :tag_list)
  end
end