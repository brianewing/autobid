class Dealer < ActiveRecord::Base
  has_secure_password

  def self.login(email, password)
    find_by_email(email).try(:authenticate, password)
  end
end
