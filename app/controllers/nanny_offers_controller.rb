class NannyOffersController < ApplicationController
  # def index
  # end

  # def show
  # end

  def new
    if current_user
      @nanny_offer = NannyOffer.new
    else
      redirect_to new_user_session_path, notice: "Vous n'êtes pas connecté à votre compte utilisateur."
    end
  end

  def create
    if current user
      @nanny_offer = NannyOffer.new(nanny_offer_params)
      @nanny_offer.user = current_user
      if @nanny_offer.save
        redirect_to user_path(@nanny_offer)
      else
        render :new
      end
    else
      redirect_to new_user_session_path, notice: "Vous n'êtes pas connecté à votre compte utilisateur."
    end
  end

  # def edit
  # end

  # def update
  # end

  def destroy
    @nanny_offer = NannyOffer.find(params[:id])
    if nanny_offer.user == current_user
      @nanny_offer.destroy!
      redirect_to nanny_offers_path
    else
     redirect_to new_user_session_path, notice: "Vous ne disposez pas des droits d'accès."
    end
  end

  private
  # To Finish when View is done
  # def nanny_offer_params
  #   params.require(:nanny_offer).permit(:description)
  # end
end
