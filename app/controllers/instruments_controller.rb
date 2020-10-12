class InstrumentsController < ApplicationController
  def index
    @instruments = Instrument.paginate(page: params[:page])
    respond_to do |format|
      format.html
    end
  end

  def show
    @instrument = Instrument.find(params[:id])
    respond_to do |format|
      format.html
    end
  end

  def new
    @instrument = Instrument.new
  end

  def create
    @instrument = Instrument.new(instrument_params)
    respond_to do |format|
      if @instrument.save
        format.html { redirect_to instruments_path, flash: { success: 'Instrument was successfully created'} }
      else
        flash['error'] = @instrument.errors.full_messages
        format.html { render :new }
      end
    end
  end

  def edit
    @instrument = Instrument.find(params[:id])
  end

  def update
    @instrument = Instrument.find(params[:id])
    respond_to do |format|
      if @instrument.update(instrument_params)
        format.html { redirect_to instruments_path, flash: { success: 'Instrument was updated'} }
      else
        flash[:error] = @instrument.errors.full_messages
        format.html { render :edit }
      end
    end
  end

  def destroy
    @instrument = Instrument.find(params[:id])
    respond_to do |format|
      @instrument.destroy
      format.html { redirect_to instruments_path, flash: { error: 'Instrument was successfully deleted' } }
    end
  end

  private

  def instrument_params
    params.require(:instrument).permit(:serie, :description, :line, :price, :brand_id)
  end
end
