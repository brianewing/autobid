class Auction < ActiveRecord::Base
  belongs_to :car
  has_one :dealer, :through => :car
  has_many :bids

  before_create :list!

  class << self
    def listed
      where('listed_at is not null')
    end

    def active
      listed.where('ends_at > ?', Time.now)
    end

    def by_dealer(dealer)
      where(:dealer_id => dealer.id)
    end
  end

  def minimum_next_bid
    if bids.highest.present?
      bids.highest.amount + 1000
    else
      start_price
    end
  end

  def current_bid
    bids.highest.present? ? bids.highest.amount : start_price
  end

  def list!
    self.listed_at = Time.now
  end
end
