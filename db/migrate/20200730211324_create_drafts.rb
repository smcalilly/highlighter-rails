class CreateDrafts < ActiveRecord::Migration[6.0]
  def change
    create_table :drafts do |t|

      t.timestamps
    end
  end
end
