class ChangeTextToBody < ActiveRecord::Migration[6.0]
  def change
    rename_column :notes, :text, :body
  end
end
