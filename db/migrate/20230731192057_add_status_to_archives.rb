class AddStatusToArchives < ActiveRecord::Migration[7.0]
  def change
    add_column :archives, :status, :string
  end
end
