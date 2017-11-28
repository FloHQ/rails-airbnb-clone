class NannyOffersController < ApplicationController
  def index
  end

  def create
  end

  def new
  end

  def edit
  end

  def show
    @nanny_offer = NannyOffer.find(params[:id])
  end

  def update
  end

  def destroy
  end
end
