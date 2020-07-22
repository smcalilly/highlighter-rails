class Tag < ApplicationRecord
  has_many :taggings
  has_many :notes, through: :taggings
  has_many :highlights, through: :taggings
end
