class Dealer < ActiveRecord::Base
  has_secure_password

  validates_presence_of :name, :email, :password, :url
  validates_uniqueness_of :email

  def self.login(email, password)
    find_by_email(email).try(:authenticate, password)
  end
end
