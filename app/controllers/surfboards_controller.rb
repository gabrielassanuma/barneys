class SurfboardsController < ApplicationController
  before_action :set_user, only: :my_surfboards

  def index
    @surfboard = Surfboard.all
  end

  def my_surfboards
    @surfboard = Surfboard.where(user: current_user)
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
    params.require(:surfboard).permit(:description, :price, :user_id, :rating, :photos)
  end

end
