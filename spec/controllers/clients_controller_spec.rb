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
end 
