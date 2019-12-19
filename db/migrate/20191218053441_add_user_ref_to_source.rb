class AddUserRefToSource < ActiveRecord::Migration[6.0]
  def change
    add_reference :sources, :user, foreign_key: true
  end
end
