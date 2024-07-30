class AddUserIdToRelatparticulares < ActiveRecord::Migration[7.0]
  def change
    add_column :relatparticulares, :user_id, :integer
    add_index :relatparticulares, :user_id
  end
end
