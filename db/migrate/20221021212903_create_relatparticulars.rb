class CreateRelatparticulars < ActiveRecord::Migration[7.0]
  def change
    create_table :relatparticulars do |t|

      t.timestamps
    end
  end
end
