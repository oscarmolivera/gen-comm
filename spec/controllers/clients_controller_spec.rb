require 'rails_helper'

RSpec.describe ClientsController, type: :controller do
  
  describe 'GET index' do
    before { get :index }

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

  describe 'GET new' do

    before { get :new, xhr: true }

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
end 
 