class CreateJoinTableTypesSubTypes < ActiveRecord::Migration[6.0]
  def change
    create_join_table :sub_types, :types do |t|
      t.index [:sub_type_id, :type_id]
      t.index [:type_id, :sub_type_id]
    end
  end
end
