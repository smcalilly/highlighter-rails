class AddNameToNotes < ActiveRecord::Migration[6.0]

  def change
    add_column :notes, :name, :string

    # Note.find_each do |note|
    #   name = truncate(note.body)
    #   note.update_column(:name, name)
    # end
  end
end
