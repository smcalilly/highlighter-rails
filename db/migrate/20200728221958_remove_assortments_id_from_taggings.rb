class RemoveAssortmentsIdFromTaggings < ActiveRecord::Migration[6.0]
  def change
    remove_column :taggings, :assortment_id, :bigint
  end
end
