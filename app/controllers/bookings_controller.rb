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
    @booking = Booking.new
    @nanny_offer = NannyOffer.find(params[:nanny_offer_id])
    # 1 : Validé, 2 : en attente, 3 : refusé
    @booking.status = "2"
    @booking.user = current_user
    @booking.nanny_offer = @nanny_offer
    #TOADD : Price calculation
    if @booking.save
      redirect_to booking_path(@booking)
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


  # def status_translate(status_string)
  #   case status_string
  #     when "1" then status = "<span class='status accepted'>Accepté</span>".html_safe
  #     when "2" then status = "<span class='status pending'>En attente</span>".html_safe
  #     when "3" then status = "<span class='status declined'>Refusé</span>".html_safe
  #   end

  #   return status
  # end

  private

  # pas besoin de params dans la création, tout est donné par l'URL et le current user
  # def booking_params
  #   params.require(:booking).permit(:nanny_offer_id, :user, :status)
  # end
end
