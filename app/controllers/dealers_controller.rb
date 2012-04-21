class DealersController < ApplicationController
  include SafeParams
  before_filter :assign_dealer

  safe :dealer, :name, :url

  def new; end

  def create
    @dealer = Dealer.create(safe_params)
  end

  private

  def assign_dealer
    @dealer ||= Dealer.new
  end
end
