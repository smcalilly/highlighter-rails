class AddUserIdToHighlights < ActiveRecord::Migration[6.0]
  def change
    add_reference :highlights, :user, foreign_key: true
  end
end
