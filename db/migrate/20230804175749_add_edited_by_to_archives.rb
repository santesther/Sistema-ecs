class AddEditedByToArchives < ActiveRecord::Migration[7.0]
  def change
    add_column :archives, :edited_by, :string
  end
end
