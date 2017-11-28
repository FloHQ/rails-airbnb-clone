class BookingsController < ApplicationController
  def index
    if current_user
      @bookings = Booking.find_by(id: current_user)
    else
      redirect_to new_user_session_path, notice: "Vous n'êtes pas connecté à votre compte utilisateur."
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    if current_user
      @nanny_offer = NannyOffer.find(params[:nanny_offer_id])
      @booking = Booking.new
    else
      redirect_to new_user_session_path, notice: "Vous n'êtes pas connecté à votre compte utilisateur."
    end
  end

  def create
    @booking = Booking.new(booking_params)
    @nanny_offer = NannyOffer.find(params[:nanny_offer_id])
    @booking.user = current_user
    @booking.nanny_offer = @nanny_offer
    #TOADD : Price calculation
    if @booking.save
      redirect_to nanny_offer_booking_path(@nanny_offer, @booking)
    else
      render:new
    end
  end

  # def edit
  # end

  # def update
  # end

  # def destroy
  # end

  private

  def booking_params
#TODO params.require(:booking).permit(:price, :date, :nanny_offer, :user)
  end
end
