require 'rails_helper'

RSpec.describe InstrumentsController, type: :controller do
  describe 'GET index' do
    it 'assigns @instruments' do
      instrument = create(:instrument)
      get :index
      expect(assigns(:instruments)).to eq([instrument])
    end
  end
end
