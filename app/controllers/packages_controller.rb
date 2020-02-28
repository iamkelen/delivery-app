class PackagesController < ApplicationController
  def new
    @package = Package.new
  end

  def create
    @package = Package.create(permitted_params.merge(courier_id: params[:courier_id]))
    if @package.valid?
      redirect_to package_path(@package), notice: 'Package was successfully created.'
    else
      flash[:alert] = 'Eshe odno slovo'
      render :new
    end
  end

  def show
    @package = Package.find(params[:id])
  end

  def edit
    @package = Package.find(params[:id])
  end

  def update
    @package = Package.find(params[:id])
    if @package.update(permitted_params)
      redirect_to package_path(@package), notice: 'Package was successfully updated.'
    else
      flash[:alert] = 'Eshe odno slovo'
      render :edit
    end
  end

  def destroy
    package = Package.find(params[:id])
    package.destroy
    redirect_to courier_path(package.courier)
  end

  private
  def permitted_params
    params.require(:package).permit(:tracking_number, :delivery_status)
  end
end
