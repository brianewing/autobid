class Car < ActiveRecord::Base
  belongs_to :model
  belongs_to :dealer
end
