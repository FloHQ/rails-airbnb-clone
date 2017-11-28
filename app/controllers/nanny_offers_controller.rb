class NannyOffersController < ApplicationController
 # def index

  # end


  def new
    @user = User.find(params[:user_id])
    @nanny_offer = NannyOffer.new
  end

  def create
    @nanny_offer = NannyOffer.new(params[:nanny_offer])
    @nanny_offer.user = User.find(params[:user_id])
    if @nanny_offer.save
      redirect_to user_path(@nanny_offer.user)
    else
      render :new
    end
  end


  def show
    @nanny_offer = NannyOffer.find(params[:id])
  end

  # def edit
  # end


  # def update
  # end

  def destroy
    @nanny_offer = NannyOffer.find(params[:id])
    @nanny_offer.destroy!
    redirect_to nanny_offers_path
  end

  private

  # A FAIRE
  # def nanny_offer_params
  #   params.require(:nanny_offer).permit(:description, :ingredient_id)
  # end
end
