class ReviewsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @review = Review.new(review_params)
    @review.user = current_user
    @review.product_id = @product.id

    if @review.save
      redirect_to @product, notice: 'Review submitted!'
    else
      redirect_to @product
    end
  end

  private

  def review_params
    params.require(:review).permit(
      :description,
      :rating
    )
  end

end
