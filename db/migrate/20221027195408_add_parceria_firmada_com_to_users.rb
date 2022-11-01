class AddParceriaFirmadaComToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :parceria_firmada_com, :string
  end
end
