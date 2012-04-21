class Car < ActiveRecord::Base
  belongs_to :model
  belongs_to :dealer

  has_one :manufacturer, :through => :model
end
