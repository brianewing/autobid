class AddDealerToAuctions < ActiveRecord::Migration
  def change
    add_column :auctions, :dealer_id, :integer
  end
end
