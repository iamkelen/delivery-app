class CouriersController < ApplicationController
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
      flash[:alert] = 'Eshe odno slovo'
      render :new
    end
  end

  def show
    @courier = Courier.find(params[:id])
  end

  def edit
    @courier = Courier.find(params[:id])
  end

  def update
    @courier = Courier.find(params[:id])
    if @courier.update(permitted_params)
      redirect_to courier_path(@courier), notice: 'Courier was successfully updated.'
    else
      flash[:alert] = 'Eshe odno slovo'
      render :edit
    end
  end

  def destroy
    courier = Courier.find(params[:id])
    courier.destroy
    redirect_to couriers_path
  end

  private
  def permitted_params
    params.require(:courier).permit(:name, :email)
  end
end
