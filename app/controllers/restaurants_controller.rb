class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[show edit destroy update]
  def index
    @restaurants = Restaurant.all
  end

  def show
    @review = Review.new
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save ? (redirect_to @restaurant) : (render :new)
  end

  def edit() end

  def update
    @restaurant.update(restaurant_params) ? (redirect_to restaurant_path(@restaurant)) : (render :edit)
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
