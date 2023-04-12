class CreateAvaliadors < ActiveRecord::Migration[7.0]
  def change
    create_table :avaliadors do |t|

      t.timestamps
    end
  end
end
