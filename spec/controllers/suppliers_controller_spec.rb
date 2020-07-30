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

  describe 'POST create' do
    subject { post :create, params: params, xhr: true }
    let(:supplier) { build(:supplier) }
  
    context 'valid params' do
      let(:params) do
        { supplier: { name: supplier.name, 
                      email: supplier.email,
                      address: supplier.address,
                      telephone: supplier.telephone,
                      photo: supplier.photo } }
      end

      it 'creates new supplier' do
        expect { subject }.to change(Supplier, :count).by(1)
      end

      it 'method create is success' do
        subject
        expect(response).to have_http_status(:success)
      end
    end

    context 'invalid params' do
      let(:params) do
        { supplier: { name: nil,
                      email: nil,
                      address: nil,
                      telephone: nil,
                      photo: nil } }
      end

      it 'does not create new supplier' do
        expect { subject }.not_to change(Supplier, :count)
      end

      it do
        subject
        expect(response).to have_http_status(405)
      end
    end
  end

  describe 'GET show' do
    # no needed in this case
  end
end 
 