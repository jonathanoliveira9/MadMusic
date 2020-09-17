class InstrumentsController < ApplicationController
  def index
    @instruments = Instrument.all
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
        format.html { redirect_to @instrument, notice: 'Instrument was successfully created'}
      else
        format.html { render :new }
      end
    end
  end

  def update
    @instrument = Instrument.find(params[:id])
    respond_to do |format|
      if @instrument.update(instrument_params)
        format.html { redirect_to @instrument, notice: 'Instrument was successfully updated' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @instrument = Instrument.find(params[:id])
    respond_to do |format|
      @instrument.destroy
      format.html { redirect_to instruments_path, notice: 'Instrument was successfully deleted' }
    end
  end

  private

  def instrument_params
    params.require(:instrument).permit(:serie, :description, :line, :price)
  end
end
