class Model < ActiveRecord::Base
  belongs_to :manufacturer

  def full_name
    "#{manufacturer.name} #{name}"
  end
end
