class Highlight < ApplicationRecord
  validates :text, :url, :source, presence: true
  belongs_to :user
  belongs_to :source
  has_many :taggings, :as => :taggable
  has_many :tags, :through => :taggings
  
  
  def tag_list
    self.tags.collect do |tag|
      tag.name
    end.join(", ")
  end

  def tag_list=(tags_string)
  end

  # TODO -- add regex on url
  ## strip it of https www
  # def test_domain_format
  #   # see if the domain matches the shopify admin api format
  #   # and strip potential https://www & /extraneous/admin/path-stuff

  #   sanitized_handle = self.handle.match /[^\s\:\/.]+\.myshopify\.com/
  #   self.handle = sanitized_handle[0]
  # rescue
  #   errors.add(:handle, "isn't a valid Shopify domain.")
  #   throw :abort
  # end
end
