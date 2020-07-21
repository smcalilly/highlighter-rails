class AddTextToNotes < ActiveRecord::Migration[6.0]
  def change
    add_column :notes, :text, :text
  end
end
