class CreateModels < ActiveRecord::Migration
  def change
    create_table :models do |t|
      t.string :name
      t.references :manufacturer

      t.timestamps
    end
    add_index :models, :manufacturer_id
  end
end
