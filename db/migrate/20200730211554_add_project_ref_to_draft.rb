class AddProjectRefToDraft < ActiveRecord::Migration[6.0]
  def change
    add_reference :drafts, :project, null: false, foreign_key: true
  end
end
