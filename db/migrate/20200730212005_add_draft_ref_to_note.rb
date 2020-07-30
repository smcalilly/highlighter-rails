class AddDraftRefToNote < ActiveRecord::Migration[6.0]
  def change
    add_reference :notes, :draft, foreign_key: true
  end
end
