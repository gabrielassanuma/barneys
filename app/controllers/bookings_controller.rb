class BookingsController < ApplicationController
  before_action :set_surfboard, only: %i[new create]

  def my_bookings
    @bookings = Booking.where(user: current_user)
  end

  def new
    @booking = Booking.new
  end

  def show
    @booking = Booking.find(params[:id])
    @surfboard = @booking.surfboard
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.surfboard = @surfboard
    @booking.user = current_user
    from = @booking.starts_at
    to = @booking.ends_at
    days = (to - from).divmod(60)[0].divmod(60)[0].divmod(24)[0]
    @booking.total_price = days * @surfboard.price
    @booking.acceptance = true
    if @booking.save
      redirect_to my_bookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to my_bookings_path, status: :see_other
  end

  private

  def set_surfboard
    @surfboard = Surfboard.find(params[:surfboard_id])
  end

  def booking_params
    params.require(:booking).permit(:starts_at, :ends_at, :comment)
  end
end
