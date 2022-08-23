class SurfboardsController < ApplicationController
  # before_action :set_user

  def index
    @surfboards = Surfboard.all
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
      redirect_to my_surfboards, notice: 'Surfboard successfully added.'
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
    params.require(:surfboard).permit(:description, :availability, :price, :user_id, :rating)
  end

end
