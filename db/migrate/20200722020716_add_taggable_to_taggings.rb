class AddTaggableToTaggings < ActiveRecord::Migration[6.0]
  def change
    add_reference :taggings, :taggable, polymorphic: true, null: false
  end
end
