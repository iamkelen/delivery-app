class CouriersController < ApplicationController
  before_action :find_courier, only: [:show, :edit, :update, :destroy]
  def index
    @couriers = Courier.all
  end

  def new
    @courier = Courier.new
  end

  def create
    @courier = Courier.create(permitted_params)
    if @courier.valid?
      redirect_to courier_path(@courier), notice: 'Courier was successfully created.'
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @courier.update(permitted_params)
      redirect_to courier_path(@courier), notice: 'Courier was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @courier.destroy
    redirect_to couriers_path
  end

  private

  def permitted_params
    params.require(:courier).permit(:name, :email)
  end

  def find_courier
    @courier = Courier.find(params[:id])
  end
end
