class Bid < ActiveRecord::Base
  belongs_to :auction

  class << self
    def by_auction(auction)
      where(:auction_id => auction.id)
    end

    def highest
      order('amount desc').first
    end
  end
end
