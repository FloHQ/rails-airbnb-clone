class NannyOffersController < ApplicationController

  def index
    # FIX - Just NannyOffers should appear
    @users = User.where.not(latitude: nil, longitude: nil)
    @nanny_offers = NannyOffer.all
    @markers = @users.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude#,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }
    end
  end

  def new
    if current_user
      @nanny_offer = NannyOffer.new
    else
      redirect_to new_user_session_path, notice: "Vous n'êtes pas connecté à votre compte utilisateur."
    end
  end

  def create
    if current_user
      @nanny_offer = NannyOffer.new(nanny_offer_params)
      @nanny_offer.user = current_user
      if @nanny_offer.save
        redirect_to nanny_offer_path(@nanny_offer)
      else
        render :new
      end
    else
      redirect_to new_user_session_path, notice: "Vous n'êtes pas connecté à votre compte utilisateur."
    end
  end


  def show
    @nanny_offer = NannyOffer.find(params[:id])
  end

  def edit
    @nanny_offer = NannyOffer.find(params[:id])
  end


  def update
    @nanny_offer = NannyOffer.find(params[:id])
    @nanny_offer.update(nanny_offer_params)

    redirect_to nanny_offer_path(@nanny_offer)
  end

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
  def nanny_offer_params
    params.require(:nanny_offer).permit(:start_date, :end_date)
  end
end
