class DealersController < ApplicationController
  before_filter :assign_dealer

  def new; end

  private

  def assign_dealer
    @dealer ||= Dealer.new
  end
end
