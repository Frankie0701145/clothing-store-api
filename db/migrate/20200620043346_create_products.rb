class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :product_name

      t.timestamps
    end
    add_index :products, :product_name
  end
end
