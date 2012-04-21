class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def current_dealer
    return nil unless session[:dealer_id]
    @dealer ||= Dealer.find_by_id(session[:dealer_id])
  end

  def login!(dealer)
    session[:dealer_id] = dealer.id
  end
end
