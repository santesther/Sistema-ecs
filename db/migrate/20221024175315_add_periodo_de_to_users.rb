class AddPeriodoDeToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :periodo_de, :integer
  end
end
