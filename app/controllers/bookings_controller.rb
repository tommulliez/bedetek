class BookingsController < ApplicationController
  before_action :set_booking, only: [ :show, :edit, :update, :destroy, :confirm ]

  def index
     @bookings = Booking.all
  end

  def show
  end

  def new

  end

  def create
    @comic = Comic.find(params[:comic_id])
     @booking = @comic.bookings.build(booking_params)
     @booking.user = current_user if current_user
    if @booking.save

      # on tente une merde
      @order = Order.new(payed:false)
      @booking.order = @order
      @order.save



      # fin de la tentative
      redirect_to profil_path(current_user)
    else
      render :new
    end


  end

  def edit
  end

  def update
     if @booking.update(booking_params)
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def confirm
    @booking.pay!
    redirect_to profil_path(current_user.profil)
  end

  def destroy
    @booking.destroy
    redirect_to booking_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_time, :end_time)
  end
end
