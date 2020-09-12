class InstrumentsController < ApplicationController
  def index
    @instruments = Instrument.all
    respond_to do |format|
      format.html
    end
  end
end
