  require 'rails_helper'

RSpec.describe ClientsController, type: :controller do
  
  describe 'GET index' do
    context 'when user IS logged in' do
      let(:user) { create(:user) }
      before do
        sign_in(user)
        get :index
      end

      context 'when some clients present' do
        let!(:client) { create(:client) } 

        it 'assigns @clients' do
          expect(assigns(:clients)).to eq([client])
        end

        it 'renders the index template' do
          expect(response).to render_template(:index)
        end
      end

      context 'when no clients' do
        it 'assigns @clients' do
          expect(assigns(:clients)).to eq([])
        end

        it 'renders the index template' do
          expect(response).to render_template(:index)
        end
      end
    end

    context 'when NO user is logged in' do
      before { get :index }
      it 'does not render the index template' do
        expect(response).not_to render_template(:index)
      end

      it do
        expect(response).to have_http_status(302)
      end

      it 'redirect to login page' do
        expect(subject).to redirect_to("/users/sign_in")
      end
    end
  end

  describe 'GET new' do
    subject { get :new, xhr: true }
    
    context 'when user IS logged in' do 
      let(:user) { create(:user) }

      before do
        sign_in(user)
        subject
      end

      it 'assigns @client' do
        expect(assigns(:client)).to be_a_new(Client)
      end

      it 'renders the new template' do
        expect(response).to render_template(:new)
      end

      it do
        expect(response).to have_http_status(200)
      end
    end
    context 'when NO user is logged in' do 
      before { subject }
      it 'does not assign @category' do
        expect(assigns(:category)).to eq(nil)
      end

      it 'does not render the new template' do
        expect(response).not_to render_template(:new)
      end

      it do
        expect(response).to have_http_status(401)
      end
    end
  end

  describe 'POST create' do
    subject { post :create, params: params, xhr: true }
    let(:client) { build(:client) }
  
    context 'valid params' do
      let(:params) do
        { client: { name: client.name, 
                    email: client.email,
                    address: client.address,
                    telephone: client.telephone } }
      end

      it 'creates new client' do
        expect { subject }.to change(Client, :count).by(1)
      end

      it 'method create is success' do
        subject
        expect(response).to have_http_status(:success)
      end
    end

    context 'invalid params' do
      let(:params) do
        { client: { name: nil,
                    email: nil,
                    address: nil,
                    telephone: nil } }
      end

      it 'does not create new client' do
        expect { subject }.not_to change(Client, :count)
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
      let(:params) { { id: client.id } }

      let!(:client) { create(:client) }

      before { subject }

      it 'assigns @client' do
        expect(assigns(:client)).to eq(client)
      end

      it 'renders the edit template' do
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'PUT update' do
    subject { put :update, params: params, xhr: true }

    let!(:client) { create(:client) }
    let( :client2) { build(:client) }

    context 'valid params' do
      let(:params) do
        { id: client.id, client: { 
                                  name: client2.name, 
                                  email: client2.email,
                                  address: client2.address,
                                  telephone: client2.telephone
                              } }
      end

      it 'updates client' do
        expect { subject }
          .to change { client.reload.name }
          .from(client.name)
          .to(params[:client][:name])
          .and change { client.reload.email }
          .from(client.email)
          .to(params[:client][:email])
          .and change { client.reload.address }
          .from(client.address)
          .to(params[:client][:address])
          .and change { client.reload.telephone }
          .from(client.telephone)
          .to(params[:client][:telephone])
      end
      
      it 'have status ok ' do 
        expect(response).to have_http_status(:ok)
      end
    end

    context 'invalid params' do
      let(:params) do
        { id: client.id, client: { 
            name: nil,
            email: nil,
            address: nil,
            telephone: nil 
         } }
      end

      it 'does not update client' do
        subject
        expect(response).to have_http_status(405)
      end
    end
    
  end

  describe 'DELETE destroy' do
    subject { delete :destroy, params: params, xhr: true }

    let!(:client) { create(:client) }

    context 'valid params' do
      let(:params) do
        { id: client.id }
      end

      it 'deletes category' do
        expect { subject }.to change(Client, :count).by(-1)
      end 
    end
  end
end 
 