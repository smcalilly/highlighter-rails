class RemoveHighlightIdFromTaggings < ActiveRecord::Migration[6.0]
  def change
    remove_column :taggings, :highlight_id, :bigint
  end
end
