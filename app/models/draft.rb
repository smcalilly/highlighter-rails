class Draft < ApplicationRecord
  belongs_to :user
  belongs_to :project
  has_many :notes

  def self.create_draft(user, project)
    @draft = Draft.new
    @draft.user = user
    @draft.project = project
    @draft.save!

    # create a new blank note to be included with the draft
    @note = Note.new(name: 'main', draft_id: @draft.id, user_id: user.id, body: '')
    @note.save!
    return @draft
  end
end
