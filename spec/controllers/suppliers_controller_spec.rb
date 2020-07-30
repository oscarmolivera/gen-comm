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

  describe 'GET edit' do
    subject { get :edit, params: params, xhr: true }
    context 'when params are valid' do
      let(:params) { { id: supplier.id } }

      let!(:supplier) { create(:supplier) }

      before { subject }

      it 'assigns @supplier' do
        expect(assigns(:supplier)).to eq(supplier)
      end

      it 'renders the edit template' do
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'PUT update' do
    subject { put :update, params: params, xhr: true }

    let!(:supplier) { create(:supplier) }
    let( :supplier2) { build(:supplier) }

    context 'valid params' do
      let(:params) do
        { id: supplier.id, supplier: { 
                                  name: supplier2.name, 
                                  email: supplier2.email,
                                  address: supplier2.address,
                                  telephone: supplier2.telephone,
                                  photo: supplier2.photo
                              } }
      end

      it 'updates supplier' do
        expect { subject }
          .to change { supplier.reload.name }
          .from(supplier.name)
          .to(params[:supplier][:name])
          .and change { supplier.reload.email }
          .from(supplier.email)
          .to(params[:supplier][:email])
          .and change { supplier.reload.address }
          .from(supplier.address)
          .to(params[:supplier][:address])
          .and change { supplier.reload.telephone }
          .from(supplier.telephone)
          .to(params[:supplier][:telephone])
      end
      
      it 'have status ok ' do 
        expect(response).to have_http_status(:ok)
      end
    end

    context 'invalid params' do
      let(:params) do
        { id: supplier.id, supplier: { 
            name: nil,
            email: nil,
            address: nil,
            telephone: nil 
         } }
      end

      it 'does not update supplier' do
        subject
        expect(response).to have_http_status(405)
      end
    end
    
  end

  describe 'DELETE destroy' do
    subject { delete :destroy, params: params, xhr: true }

    let!(:supplier) { create(:supplier) }

    context 'valid params' do
      let(:params) do
        { id: supplier.id }
      end

      it 'deletes category' do
        expect { subject }.to change(Supplier, :count).by(-1)
      end 
    end
  end
end
 