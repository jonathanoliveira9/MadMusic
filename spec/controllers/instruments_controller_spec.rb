require 'rails_helper'

RSpec.describe InstrumentsController, type: :controller do
  describe 'GET #index' do
    let(:instruments) { create_list(:instrument, 2) }
    before { get :index }
    it `assigns @instruments` do
      expect(assigns(:instruments)).to match_array instruments
    end

    it `has 200 status code` do
      expect(response).to have_http_status(:ok)
    end

    it `render the :index template` do
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    let(:instrument) { create(:instrument) }
    before { get :show, params: { id: instrument.id } }
    it `has 200 status code` do
      expect(response).to have_http_status(:ok)
    end

    it `assigns @instrument` do
      expect(assigns(:instrument)).to eq(instrument)
    end

    it `render the :show template` do
      expect(response).to render_template :show
    end
  end

  describe `GET #new` do
    before { get :new, params: {} }
    it `has 200 status code` do
      expect(response).to have_http_status(:ok)
    end

    it `assings new @article` do
      expect(assigns(:instrument)).to be_a_new Instrument
    end

    it `render the :new template` do
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    let(:instrument_params) { attributes_for(:instrument) }

    it 'saves new instrument' do
      expect do
        post :create, params: { instrument: instrument_params }
      end.to change(Instrument, :count).by(1)
      expect(response).to redirect_to Instrument.last
    end

    it 'don´t save instrument' do
      expect do
        instrument_params.shift
        post :create, params: { instrument: instrument_params }
      end.to change(Instrument, :count).by(0)
      expect(response).to render_template(:new)
    end
  end
end
