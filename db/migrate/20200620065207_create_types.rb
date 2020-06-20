class CreateTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :types do |t|
      t.decimal :price, precision: 5, scale: 2
      t.integer :quantity

      t.timestamps
    end
  end
end
