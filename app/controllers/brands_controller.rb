class BrandsController < ApplicationController
  before_action :authenticate_user!
  def index
    @brands = Brand.paginate(page: params[:page])
    respond_to do |format|
      format.html
    end
  end

  def new
    @brand = Brand.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @brand = Brand.new(brands_params)
    respond_to do |format|
      if @brand.save
        format.html { redirect_to brands_path, flash: { success: 'Brand was successfully created' } }
      else
        format.html { render :new }
      end
    end
  end

  def show
    @brand = Brand.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def edit
    @brand = Brand.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def update
    @brand = Brand.find(params[:id])
    respond_to do |format|
      if @brand.update(brands_params)
        format.html { redirect_to brands_path, flash: { success: 'Brand was successfully created' }}
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @brand = Brand.find(params[:id])
    respond_to do |format|
      @brand.destroy
      format.html { redirect_to brands_path, flash: { success: 'Brand was successfully deleted' } }
    end
  end

  private

  def brands_params
    params.require(:brand).permit(:description, :fantasy_name, :picture)
  end
end
