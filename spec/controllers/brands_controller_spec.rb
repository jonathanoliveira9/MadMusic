require 'rails_helper'

RSpec.describe BrandsController, type: :controller do
  describe 'GET #index' do
    let(:brands) { create_list(:brand, 2) }
    before { get :index }
    it `assigns @brands` do
      expect(assigns(:brands)).to match_array brands
    end

    it `has 200 status code` do
      expect(response).to have_http_status(:ok)
    end

    it `render the :index template` do
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    let(:brand) { create(:brand) }
    before { get :show, params: { id: brand.id }, xhr: true }
    it `has 200 status code` do
      expect(response).to have_http_status(:ok)
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
      expect(assigns(:brand)).to be_a_new Brand
    end

    it `render the :new template` do
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    let(:brand_params) { attributes_for(:brand) }

    it 'saves new brand' do
      expect do
        post :create, params: { brand: brand_params }
      end.to change(Brand, :count).by(1)
      expect(response).to redirect_to brands_path
    end

    it 'don´t save brand' do
      expect do
        brand_params.shift
        post :create, params: { brand: brand_params }
      end.to change(Brand, :count).by(0)
      expect(response).to render_template(:new)
    end
  end

  describe 'PATCH #update' do
    let(:brand) { create(:brand) }
    let(:update_attrs) { { description: 'none' } }

    it 'update changes' do
      expect do
        patch :update, params: { id: brand.id, brand: update_attrs }
      end.to change(Brand, :count).by(1)
      expect(response).to redirect_to brands_path
    end

    it 'update brand' do
      patch :update, params: { id: brand.id, brand: update_attrs }
      brand.reload
      expect(brand.description).to eq update_attrs[:description]
    end

    it 'render the :edit template' do
      patch :update, params: { id: brand.id, brand: { description: nil } }
      expect(response).to render_template(:edit)
    end
  end

  describe 'DELETE #destroy' do
    let(:brand) { create(:brand) }
    it 'delete the brand' do
      expect do
        delete :destroy, params: { id: brand.id }
      end.to change(Brand, :count).by(0)
    end
    it 'redirects the index template' do
      delete :destroy, params: { id: brand.id }
      expect(response).to redirect_to(brands_path)
    end
  end
end
