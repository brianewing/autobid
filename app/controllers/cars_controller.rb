class CarsController < ApplicationController
  include SafeParams

  before_filter :ensure_dealer
  before_filter :assign_car, :only => [:new, :update, :edit]

  safe :car, :name, :year, :model_id, :mileage, :color

  def new; end

  def index
    @cars = Car.find_all_by_dealer_id(current_dealer.id)
  end

  def show; end
  def edit; end

  def create
    car = safe_params
    car[:model] = Model.find_by_id(car.delete(:model_id))

    @car = Car.by_dealer(current_dealer).create(car)

    if @car.persisted?
      flash[:info] = "Car has been created. Start an auction to begin selling"
      redirect_to :cars
    else
      flash.now[:errors] = @car.errors.full_messages
      render :new
    end
  end

  def update
    car = safe_params
    car[:model] = Model.find_by_id(car.delete(:model_id))

    @car.update_attributes(car)
    flash[:success] = "Car updated"
    redirect_to :cars
  end

  def edit; end

  private

  def ensure_dealer
    redirect_to :root if not current_dealer.present?
  end

  def assign_car
    if params[:id]
      @car = Car.by_dealer(current_dealer).find_by_id(params[:id])
    end

    @car ||= Car.new
  end
end
