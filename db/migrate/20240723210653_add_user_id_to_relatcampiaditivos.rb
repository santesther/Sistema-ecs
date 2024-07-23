class AddUserIdToRelatcampiaditivos < ActiveRecord::Migration[7.0]
  def change
    add_column :relatcampiaditivos, :user_id, :integer
    add_index :relatcampiaditivos, :user_id
  end
end
