class AuctionsController < ApplicationController
  before_filter :ensure_dealer, :only => [:new, :create, :update]
  before_filter :assign_auction, :only => [:new, :update, :edit]

  def index
    if dealer?
      @auctions = Auction.by_dealer(current_dealer).active
    else
      @auctions = Auction.active
    end
  end

  def new; end

  def create
    
  end

  private

  def assign_auction
    if params[:id]
      @auction = Auction.by_dealer(current_dealer).find_by_id(params[:id])
    end

    @auction ||= Auction.new
  end

  def ensure_dealer
    redirect_to :root unless dealer?
  end
end
