class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @nanny_offer = NannyOffer.find(params[:nany_offer_id])
    @review.user = current_user
    @review.nanny_offer = @nanny_offer
    if @review.save
      redirect_to nanny_offer_review_path(@nanny_offer, @review)
    else
      render:new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :description)
  end
end


