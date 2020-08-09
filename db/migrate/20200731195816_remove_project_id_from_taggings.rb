class RemoveProjectIdFromTaggings < ActiveRecord::Migration[6.0]
  def change
    remove_column :taggings, :project_id, :bigint
  end
end
