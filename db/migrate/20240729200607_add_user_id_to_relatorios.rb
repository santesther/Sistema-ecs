class AddUserIdToRelatorios < ActiveRecord::Migration[7.0]
  def change
    add_column :relatorios, :user_id, :integer
    add_index :relatorios, :user_id
  end
end
