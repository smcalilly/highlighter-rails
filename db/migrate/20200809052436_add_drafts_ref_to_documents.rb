class AddDraftsRefToDocuments < ActiveRecord::Migration[6.0]
  def change
    add_reference :documents, :draft, null: false, foreign_key: true
  end
end
