class Project < ApplicationRecord
  include Taggable
  belongs_to :user
  has_one :draft
  has_many :taggings, :as => :taggable
  has_many :tags, :through => :taggings
end
