class CreateSources < ActiveRecord::Migration[6.0]
  def change
    create_table :sources do |t|
      t.string :location
      t.string :title

      t.timestamps
    end
  end
end
