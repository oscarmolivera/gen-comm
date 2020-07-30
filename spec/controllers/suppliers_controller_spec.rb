require 'rails_helper'

RSpec.describe SuppliersController, type: :controller do
  describe 'GET index' do
    before { get :index }

    context 'when some suppliers present' do
      let!(:supplier) { create(:supplier) } 

      it 'assigns @suppliers' do
        expect(assigns(:suppliers)).to eq([supplier])
      end

      it 'renders the index template' do
        expect(response).to render_template(:index)
      end
    end

    context 'when no suppliers' do
      it 'assigns @suppliers' do
        expect(assigns(:suppliers)).to eq([])
      end

      it 'renders the index template' do
        expect(response).to render_template(:index)
      end
    end
  end

  describe 'GET new' do

    before { get :new, xhr: true }

    it 'assigns @Supplier' do
      expect(assigns(:supplier)).to be_a_new(Supplier)
    end

    it 'renders the new template' do
      expect(response).to render_template(:new)
    end

    it do
      expect(response).to have_http_status(200)
    end
  end
end 
 