class BrandsController < ApplicationController
  autocomplete :brand, :fantasy_name

  def index
    @brands = Brand.paginate(page: params[:page])
    respond_to do |format|
      format.html
      if params[:term].present?
        @brands = Brand.where('fantasy_name LIKE ?', "%#{params[:term]}%")
        render json: @brands.map { |b| "#{b.fantasy_name}" }
      end
    end
  end

  def show
    @brand = Brand.find(params[:id])
    respond_to do |format|
      format.html
    end
  end

  def new
    @brand = Brand.new
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

  def edit
    @brand = Brand.find(params[:id])
  end

  def update
    @brand = Brand.find(params[:id])
    respond_to do |format|
      if @brand.update(brands_params)
        format.html { redirect_to @brand, flash: { success: 'Brand was successfully created' }}
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
    params.require(:brand).permit(:description, :fantasy_name)
  end
end
