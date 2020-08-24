require 'rails_helper'

RSpec.describe SalesController, type: :controller do 

  describe 'GET Index' do
    context 'when user IS logged in' do
      let(:user) { create(:user) }
      before do
        sign_in(user)
        get :index
      end

      context 'and some sales are present' do
        let!(:sale) { create(:sale) } 

        it 'assigns @sales' do
          expect(assigns(:sales)).to eq([sale])
        end

        it 'renders the index template' do
          expect(response).to render_template(:index)
        end
      end
    end

    context 'when NO user in logged in' do
    end
  end
end
 