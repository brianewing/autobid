class Auction < ActiveRecord::Base
  belongs_to :car
  has_one :dealer, :through => :car

  class << self
    def listed
      where('listed_at is not null')
    end

    def active
      listed.where('ends_at < ?', Time.now)
    end

    def by_dealer(dealer)
      where(:dealer_id => dealer.id)
    end
  end
end
