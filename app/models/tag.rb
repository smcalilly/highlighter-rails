class Tag < ApplicationRecord
  has_many :taggings

  # cleaner way to retrieve models by polymorphic tags
  has_many :notes, :through => :taggings, :source => :taggable,
            :source_type => 'Note'
  has_many :highlights, :through => :taggings, :source => :taggable,
            :source_type => 'Highlight'
  has_many :assortments, :through => :taggings, :source => :taggable,
            :source_type => 'Assortment'
end