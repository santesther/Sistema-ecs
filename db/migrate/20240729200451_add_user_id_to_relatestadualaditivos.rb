class AddUserIdToRelatestadualaditivos < ActiveRecord::Migration[7.0]
  def change
    add_column :relatestadualaditivos, :user_id, :integer
    add_index :relatestadualaditivos, :user_id
  end
end
