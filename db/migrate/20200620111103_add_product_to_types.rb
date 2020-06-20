class AddProductToTypes < ActiveRecord::Migration[6.0]
  def change
    add_reference :types, :product, foreign_key: true
  end
end
