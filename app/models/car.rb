class Car < ActiveRecord::Base
  belongs_to :model
  belongs_to :dealer

  has_one :manufacturer, :through => :model
  validates_presence_of :model, :dealer, :name, :year, :mileage, :color
end
