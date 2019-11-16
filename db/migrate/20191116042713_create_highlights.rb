class CreateHighlights < ActiveRecord::Migration[6.0]
  def change
    create_table :highlights do |t|
      t.text :text
      t.string :url

      t.timestamps
    end
  end
end
