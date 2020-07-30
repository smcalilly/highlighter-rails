class Draft < ApplicationRecord
  belongs_to :user
  belongs_to :project
  has_many :notes
end
