class AddPeriodoToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :periodo, :integer
  end
end
