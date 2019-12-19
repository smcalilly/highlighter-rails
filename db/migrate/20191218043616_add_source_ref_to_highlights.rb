class AddSourceRefToHighlights < ActiveRecord::Migration[6.0]
  def change
    add_reference :highlights, :source, foreign_key: true
  end
end
