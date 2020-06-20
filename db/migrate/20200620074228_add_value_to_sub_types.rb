class AddValueToSubTypes < ActiveRecord::Migration[6.0]
  def change
    add_column :sub_types, :value, :string
  end
end
