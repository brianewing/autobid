class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :name
      t.integer :year
      t.references :model
      t.integer :mileage
      t.string :color
      t.references :dealer

      t.timestamps
    end
    add_index :cars, :model_id
    add_index :cars, :dealer_id
  end
end
