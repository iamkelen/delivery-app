class PackagesController < ApplicationController
  before_action :find_package, only: [:show, :edit, :update, :destroy]
  def new
    @package = Package.new
  end

  def create
    @package = Package.create(permitted_params.merge(courier_id: params[:courier_id]))
    if @package.valid?
      redirect_to package_path(@package), notice: 'Package was successfully created.'
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @package.update(permitted_params)
      redirect_to package_path(@package), notice: 'Package was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @package.destroy
    redirect_to courier_path(@package.courier)
  end

  private

  def permitted_params
    params.require(:package).permit(:tracking_number, :delivery_status)
  end

  def find_package
    @package = Package.find(params[:id])
  end

end
