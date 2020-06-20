class AddProductToSubTypes < ActiveRecord::Migration[6.0]
  def change
    add_reference :sub_types, :product, foreign_key: true
  end
end
