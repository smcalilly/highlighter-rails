class AddUsersRefToDraft < ActiveRecord::Migration[6.0]
  def change
    add_reference :drafts, :user, null: false, foreign_key: true
  end
end
