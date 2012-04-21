class Manufacturer < ActiveRecord::Base
  validates_uniqueness_of :name

  has_many :models
end
