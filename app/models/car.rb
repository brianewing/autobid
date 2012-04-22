class Car < ActiveRecord::Base
  belongs_to :model
  belongs_to :dealer

  has_one :manufacturer, :through => :model
  has_many :car_attributes

  validates_presence_of :model, :dealer, :name, :year, :mileage, :color

  class << self
    def by_dealer(dealer)
      where(:dealer_id => dealer.id)
    end
  end

  def thumb_image_url
    "http://placehold.it/128x128"
  end
end
