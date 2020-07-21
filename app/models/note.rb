class Note < ApplicationRecord
  acts_as_taggable_on :tags
  belongs_to :user
end
