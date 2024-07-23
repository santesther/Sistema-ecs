class AddUserIdToCartaApresentacoes < ActiveRecord::Migration[7.0]
  def change
    add_column :carta_apresentacoes, :user_id, :integer
    add_index :carta_apresentacoes, :user_id
  end
end
