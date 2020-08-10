class Draft < ApplicationRecord
  belongs_to :user
  belongs_to :project
  has_many :documents

  def self.create_draft(user, project)
    @draft = Draft.new
    @draft.user = user
    @draft.project = project
    @draft.save!

    # create a document to be included with the draft
    document_params = {
      user_id: user.id,
      draft_id: @draft.id
    }

    
    @document = Document.new(document_params)
    puts @draft.inspect
    puts @document.inspect
    @document.save!
    return @draft
  end
end
