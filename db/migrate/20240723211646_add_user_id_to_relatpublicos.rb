class AddUserIdToRelatpublicos < ActiveRecord::Migration[7.0]
  def change
    add_column :relatpublicos, :user_id, :integer
    add_index :relatpublicos, :user_id
  end
end
