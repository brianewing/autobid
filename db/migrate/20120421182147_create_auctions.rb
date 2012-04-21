class CreateAuctions < ActiveRecord::Migration
  def change
    create_table :auctions do |t|
      t.references :car
      t.integer :start_price
      t.timestamp :listed_at
      t.timestamp :ends_at

      t.timestamps
    end
    add_index :auctions, :car_id
  end
end
