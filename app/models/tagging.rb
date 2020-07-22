class Tagging < ApplicationRecord
  belongs_to :tag
  belongs_to :note
  belongs_to :highlight
end
