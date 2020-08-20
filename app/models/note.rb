class Note < ApplicationRecord
  belongs_to :user
  has_many :taggings, :as => :taggable
  has_many :tags, :through => :taggings
  has_rich_text :content

  include Tagger

  def tag_list
    self.tags.collect do |tag|
      tag.name
    end.join(", ")
  end

  def tag_list=(tags_string)
  end

  def self.create_note(note_params, current_user, tags)
    @note = Note.new(note_params)
    @note.user = current_user
    @note.tags = tags
    return @note
  end
end

