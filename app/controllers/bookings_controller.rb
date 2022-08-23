class BookingsController < ApplicationController

  def my_bookings
    @booking = Booking.where(user: current_user)
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.surfboard = @surfboard
    if booking.save
      redirect_to my_bookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to my_bookings_path
  end

  private

  def set_surfboard
    @surfboard = Surfboard.find(params[:surfboard_id])
  end

  def booking_params
    params.require(:booking).permit(:starts_at, :ends_at, :total_price, :acceptance, :comment)
  end
end
