class ReviewsController < ApplicationController
  before_action :set_restaurant, only: [:new, :create, :index]
  def new
    # we need @restaurant in our `simple_form_for`
    @review = Review.new
  end

  def index
    @reviews = @restaurant.reviews
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    # we need `restaurant_id` to asssociate review with corresponding restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      p review.errors
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end






