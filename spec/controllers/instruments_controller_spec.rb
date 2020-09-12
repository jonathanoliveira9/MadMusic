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
  end
end
