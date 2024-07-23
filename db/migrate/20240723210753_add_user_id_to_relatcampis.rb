class AddUserIdToRelatcampis < ActiveRecord::Migration[7.0]
  def change
    add_column :relatcampis, :user_id, :integer
    add_index :relatcampis, :user_id
  end
end
