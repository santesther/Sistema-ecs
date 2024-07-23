class AddUserIdToRelataditivocentros < ActiveRecord::Migration[7.0]
  def change
    add_column :relataditivocentros, :user_id, :integer
    add_index :relataditivocentros, :user_id
  end
end
