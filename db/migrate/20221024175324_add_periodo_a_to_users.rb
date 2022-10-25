class AddPeriodoAToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :periodo_a, :integer
  end
end
