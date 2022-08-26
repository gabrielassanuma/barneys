class BookingsController < ApplicationController
  before_action :set_surfboard, only: %i[new create]

  def my_bookings
    # @surfboards = Surfboard.all
    @bookings = Booking.where(user: current_user)
    surfboards = @bookings.map {|booking| booking.surfboard }
    @surfboards = Surfboard.where(id: surfboards.pluck(:id))
    @markers = @surfboards.geocoded.map do |surfboard|
      {
        lat: surfboard.latitude,
        lng: surfboard.longitude,
        info_window: render_to_string(partial: "surfboards/info_window", locals: { surfboard: surfboard }),
        image_url: helpers.asset_url("logomap.png")
      }
    end
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
    @booking.surfboard = @surfboards
    @booking.user = current_user
    from = @booking.starts_at
    to = @booking.ends_at
    days = (to - from).divmod(60)[0].divmod(60)[0].divmod(24)[0]
    @booking.total_price = days * @surfboards.price
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
    @surfboards = Surfboard.find(params[:surfboard_id])
  end

  def booking_params
    params.require(:booking).permit(:starts_at, :ends_at, :comment)
  end
end
