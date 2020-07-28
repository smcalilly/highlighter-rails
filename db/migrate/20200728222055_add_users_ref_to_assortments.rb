class AddUsersRefToAssortments < ActiveRecord::Migration[6.0]
  def change
    add_reference :assortments, :user, null: false, foreign_key: true
  end
end
