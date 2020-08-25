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

      context 'and no there are no sales' do
        it 'assigns @sales' do
          expect(assigns(:sales)).to eq([])
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

    context 'when user IS logged in' do
      let(:user) { create(:user) }
      let(:sale) { create(:sale, amount: 0) }

      before do
        sign_in(user)
        get :new
      end

      it 'assigns @sale with amount = 0' do
        expect(assigns(:sale).amount).to eq(sale.amount) 
      end
  
      it 'redirects to edit' do
        expect(response).to render_template(:edit)
      end
  
      xit do
        expect(response).to have_http_status(200)
      end
    end

    context 'when NO user is logged in' do 
      before { get :new, xhr: true }
      
      xit 'does not assign @category' do
        expect(assigns(:sale)).to eq(nil)
      end

      xit 'does not render the new template' do
        expect(response).not_to render_template(:new)
      end

      xit do
        expect(response).to have_http_status(401)
      end
    end
  end
end
  