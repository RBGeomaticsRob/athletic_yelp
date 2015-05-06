class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def new
  end

  def params_restaurant
    params.require(:restaurant).permit(:name)
  end

  def create
    Restaurant.create(params_restaurant)
    redirect_to '/restaurants'
  end
end
