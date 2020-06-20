class CreateTypesSubTypesJoinTable < ActiveRecord::Migration[6.0]
  def change

      create_join_table :types, :sub_types do |t|
        t.index :types_id
        t.index :sub_types_id
      end
  end
end
