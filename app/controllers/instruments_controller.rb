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
end
