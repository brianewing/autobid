class DealersController < ApplicationController
  include SafeParams
  before_filter :assign_dealer
  before_filter :ensure_dealer, :only => [:update]
  before_filter :ensure_no_dealer, :only => [:create, :new]

  safe :dealer, :name, :url, :email, :password

  def new; end

  def create
    @dealer = Dealer.create(safe_params)
    
    if @dealer.invalid?
      flash.now[:errors] = @dealer.errors.full_messages
      render :new
    else
      login! @dealer
    end
  end

  private

  def assign_dealer
    @dealer ||= Dealer.new
  end

  def ensure_dealer
    redirect_to root_url unless current_dealer.present?
  end

  def ensure_no_dealer
    redirect_to root_url if current_dealer.present?
  end
end
