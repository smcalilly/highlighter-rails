module Highlightable
  def create_highlight
    @highlight = Highlight.new(highlight_params)
    @highlight.user = current_user

    if highlight_params[:tag_list]
      @tags = find_or_create_tags(highlight_params, current_user.id)
      @highlight.tags = @tags
    end

    @source = Source.find_or_create_by(source)
    authorize @source      
    @highlight.source = @source
    
    authorize @highlight
  end
  
  def source
    return {
      user_id: current_user.id,
      location: highlight_params[:url],
      title: highlight_params[:url]
    }
  end

  def highlight_params
    params.require(:highlight).permit(:text, :url, :tag_list)
  end
end