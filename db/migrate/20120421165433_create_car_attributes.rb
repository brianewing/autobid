class CreateCarAttributes < ActiveRecord::Migration
  def change
    create_table :car_attributes do |t|
      t.references :car
      t.string :name
      t.string :value

      t.timestamps
    end
    add_index :car_attributes, :car_id
  end
end
