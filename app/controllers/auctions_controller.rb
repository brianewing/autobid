class AuctionsController < ApplicationController
  include SafeParams

  before_filter :ensure_dealer, :only => [:new, :create, :update]
  before_filter :assign_auction, :only => [:new, :update, :edit, :show]

  safe :auction, :car_id, :'ends_at(3i)', :'ends_at(2i)', :'ends_at(1i)', :start_price

  def index
    if dealer?
      @auctions = Auction.by_dealer(current_dealer).active
    else
      @auctions = Auction.active
    end
  end

  def new; end
  def show; end

  def create
    auction = safe_params
    auction[:car] = Car.by_dealer(current_dealer).find_by_id(auction.delete(:car_id))
    auction[:ends_at] = Time.parse "#{auction.delete('ends_at(1i)')}/#{auction.delete('ends_at(2i)')}/#{auction.delete('ends_at(3i)')} #{Time.now.strftime '%H:%M'}"
    
    if auction[:ends_at].today?
      auction[:ends_at] += 1.day
    end

    @auction = Auction.by_dealer(current_dealer).create(auction)

    if @auction.persisted?
      redirect_to @auction
    else
      flash.now[:errors] = @auctions.errors.full_messages
      render :new
    end
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
