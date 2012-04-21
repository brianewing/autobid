class CarsController < ApplicationController
  before_filter :ensure_dealer

  def index
    @cars = Car.find_all_by_dealer_id(current_dealer.id)
  end

  private

  def ensure_dealer
    redirect_to :root if not current_dealer.present?
  end
end
