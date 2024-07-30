class AddUserIdToRelatnaoformais < ActiveRecord::Migration[7.0]
  def change
    add_column :relatnaoformais, :user_id, :integer
    add_index :relatnaoformais, :user_id
  end
end
