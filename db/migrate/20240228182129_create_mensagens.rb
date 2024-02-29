class CreateMensagens < ActiveRecord::Migration[5.2]
  def change
    create_table :mensagens do |t|
      t.text :texto
      t.references :destinatario, index: true, foreign_key: { to_table: :users }
      t.references :remetente, index: true, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
