class RemoveNoteIdFromTaggings < ActiveRecord::Migration[6.0]
  def change
    remove_index :taggings, :note_id
    remove_column :taggings, :note_id, :string
  end
end
