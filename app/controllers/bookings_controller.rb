class BookingsController < ApplicationController
  before_action :set_booking, only: [ :show, :edit, :update, :destroy ]

  def index
     @bookings = Booking.all
  end

  def show
  end

  def new
    @bookings = Booking.new
  end

  def create
     @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to profile_path(@profile)
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
