class Car < ActiveRecord::Base
  belongs_to :model
  belongs_to :dealer

  has_one :manufacturer, :through => :model
  has_many :car_attributes
  
  validates_presence_of :model, :dealer, :name, :year, :mileage, :color
end
