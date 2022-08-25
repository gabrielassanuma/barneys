class SurfboardsController < ApplicationController

  def index
    if params[:query].present?
      @surfboards = Surfboard.where("address ILIKE ?", "%#{params[:query]}%")
    else
      @surfboards = Surfboard.all
    end
    @markers = @surfboards.geocoded.map do |surfboard|
      {
        lat: surfboard.latitude,
        lng: surfboard.longitude,
        info_window: render_to_string(partial: "info_window", locals: { surfboard: surfboard }),
        image_url: helpers.asset_url("logomap.png")
      }
    end
  end

  def my_surfboards
    @surfboard = Surfboard.where(surfboard.user == @user)
  end

  def show
    @surfboard = Surfboard.find(params[:id])
  end

  def new
    @surfboard = Surfboard.new
  end

  def create
    @surfboard = Surfboard.new(surfboard_params)
    @surfboard.user = current_user
    if @surfboard.save
      redirect_to root_path, notice: 'Surfboard successfully added.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @surfboard = Surfboard.find(params[:id])
    @surfboard.destroy
    redirect_to my_surfboards_path(@surfboard.user), notice: 'Surfboard destroyed'
  end

  private

  def surfboard_params
    params.require(:surfboard).permit(:description, :price, :rating, :photos)
  end
end
