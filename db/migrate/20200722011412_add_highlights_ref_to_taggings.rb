class AddHighlightsRefToTaggings < ActiveRecord::Migration[6.0]
  def change
    add_reference :taggings, :highlight, foreign_key: true
  end
end
