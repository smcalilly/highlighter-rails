class Note < ApplicationRecord
  belongs_to :user
  has_many :taggings, :as => :taggable
  has_many :tags, :through => :taggings
  has_rich_text :content

  def tag_list
    self.tags.collect do |tag|
      tag.name
    end.join(", ")
  end

  def tag_list=(tags_string)
  end
end

