module Draftable
  def set_documents
    @documents = Document.where(user_id: current_user.id, draft_id: params[:id])
    authorize @documents
  end

  def set_draft
    @draft = Draft.where(user_id: current_user.id, project_id: params[:id])
    authorize @draft
  end 
end