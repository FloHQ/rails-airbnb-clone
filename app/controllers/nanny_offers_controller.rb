class NannyOffersController < ApplicationController

 def index
      users_id_array = []
      @users_complied = User.where.not(latitude: nil, longitude: nil)
      if params[:search_location].present? && params[:search_distance].present?
        @users_legitimacy = User.near(params[:search_location], params[:search_distance] || 2, order: :search_distance)
        @users_complied.each do |user|
          if @users_legitimacy.include?(user)
            users_id_array << user.id
          end
        end
      elsif current_user
        @users_legitimacy = User.near(current_user.appartment_address, 2)
        @users_complied.each do |user|
          if @users_legitimacy.include?(user)
            users_id_array << user.id
          end
        end
      else
        @users_complied.each do |user|
          users_id_array << user.id
        end
      end

    @nanny_offers = NannyOffer.where(user_id: users_id_array)

    @markers = @nanny_offers.map do |nanny_offer|
      {
        lat: nanny_offer.user.latitude,
        lng: nanny_offer.user.longitude#,
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
    @booking = Booking.new
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
    params.require(:nanny_offer).permit(:start_date, :end_date, :price, :children_capacity, :nanny_description, :appartment_description)
  end
end
