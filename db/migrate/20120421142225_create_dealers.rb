class CreateDealers < ActiveRecord::Migration
  def change
    create_table :dealers do |t|
      t.string :name
      t.string :url
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
