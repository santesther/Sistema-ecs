class AddEstagioToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :situacao, :string, :default => '0'
    add_column :users, :pdf_centro, :boolean, :default => false
    add_column :users, :pdf_guarus, :boolean, :default => false
    add_column :users, :pdf_publico, :boolean, :default => false
    add_column :users, :pdf_particular, :boolean, :default => false
    add_column :users, :pdf_naoformal, :boolean, :default => false
    add_column :users, :status_impressao, :boolean, :default => false
  end
end
