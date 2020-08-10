class Document < ApplicationRecord
  belongs_to :user
  belongs_to :draft
  
  has_rich_text :content
end
