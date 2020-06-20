class CreateSubTypeOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :sub_type_options do |t|
      t.string :option

      t.timestamps
    end
  end
end
