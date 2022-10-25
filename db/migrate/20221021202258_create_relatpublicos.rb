class CreateRelatpublicos < ActiveRecord::Migration[7.0]
  def change
    create_table :relatpublicos do |t|

      t.timestamps
    end
  end
end
