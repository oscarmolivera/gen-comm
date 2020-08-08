require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  
  describe 'GET index' do

    context 'when user IS logged in' do
      let(:user) { create(:user) }
      before do
        sign_in(user)
        get :index
      end
      context 'and some categories present' do
        let!(:category) { create(:category) } 

        it 'assigns @categories' do
          expect(assigns(:categories)).to eq([category])
        end

        it 'renders the index template' do
          expect(response).to render_template(:index)
        end
      end

      context 'and no categories' do
        it 'assigns @categories' do
          expect(assigns(:categories)).to eq([])
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

      before do
        sign_in(user)
        get :new, xhr: true
      end

      it 'assigns @category' do
        expect(assigns(:category)).to be_a_new(Category)
      end
  
      it 'renders the new template' do
        expect(response).to render_template(:new)
      end
  
      it do
        expect(response).to have_http_status(200)
      end
    end

    context 'when NO user is logged in' do 
      before { get :new, xhr: true }
      
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

    context 'when user IS logged in' do
      let(:user) { create(:user) }
      let(:category) { build(:category) }
      
      before { sign_in(user) }

      context 'valid params' do
        let(:params) do
          { category: { name: category.name, description: category.description } }
        end

        it 'creates new category' do
          expect { subject }.to change(Category, :count).by(1)
        end

        it 'method create is success' do
          subject
          expect(response).to have_http_status(:success)
        end
      end

      context 'invalid params' do
        let(:params) do
          { category: { name: nil, description: nil } }
        end

        it 'does not create new category' do
          expect { subject }.not_to change(Category, :count)
        end

        it do
          subject
          expect(response).to have_http_status(405)
        end
      end
    end

    context 'when NO user id logged in' do 
      context 'valid params' do
        let(:category) { build(:category) }
        let(:params) do
          { category: { name: category.name, description: category.description } }
        end

        it 'does not create new category' do
          expect { subject }.not_to change(Category, :count)
        end

        it do
          subject
          expect(response).to have_http_status(401)
        end
      end

      context 'invalid params' do
        let(:params) do
          { category: { name: nil, description: nil } }
        end

        it 'does not create new category' do
          expect { subject }.not_to change(Category, :count)
        end

        it do
          subject
          expect(response).to have_http_status(401)
        end
      end
    end
  end

  describe 'GET show' do
    # no needed in this case
  end

  describe 'GET edit' do
    subject { get :edit, params: params, xhr: true }
    context 'when user IS logged in' do
      
      let(:user) { create(:user) }
      before { sign_in(user) } 
      
      context 'and params are valid' do
        let!(:category) { create(:category) }
        let(:params) { { id: category.id } }
  
        before { subject }
  
        it 'assigns @category' do
          expect(assigns(:category)).to eq(category)
        end
  
        it 'renders the edit template' do
          expect(response).to render_template(:edit)
        end
      end
    end

    context 'when NO user is logged in' do
      let(:params) { { id: 1 } }
      context 'and params are valid' do
        it 'does not assigns @category' do
          expect(assigns(:category)).to eq(nil)
        end
        it 'response code:Unauthorized' do
          subject
          expect(response).to have_http_status(401)
        end
      end
    end
  end

  describe 'PUT update' do
    subject { put :update, params: params, xhr: true }
    let!(:category) { create(:category) }

    context 'when user IS logged in' do
      
      let(:user) { create(:user) }
      before{ sign_in(user)}
      
      context 'and sends valid params' do
        let(:params) do
          { id: category.id, category: { name: 'kot', description: 'New Description' } }
        end

        it 'updates category' do
          expect { subject }
            .to change { category.reload.name }
            .from(category.name)
            .to(params[:category][:name])
            .and change { category.reload.description }
            .from(category.description)
            .to(params[:category][:description])
        end
        
        it 'have status ok ' do 
          expect(response).to have_http_status(:ok)
        end
      end

      context 'and sends invalid params' do
        let(:params) do
          { id: category.id, category: { name: nil, description: nil  } }
        end

        it 'does not update category' do
          subject
          expect(response).to have_http_status(405)
        end
      end
    end

    context 'when NOT user is logged in' do 
      context 'and sends valid params' do 
        let(:params) do
          { id: category.id, category: { name: 'kot', description: 'New Description' } }
        end

        it 'does not update word' do
          expect { subject }.not_to change { category.reload.name }        
          expect { subject }.not_to change { category.reload.description }        
        end
      end
    end    
  end

  describe 'DELETE destroy' do
    subject { delete :destroy, params: params, xhr: true }
    let!(:category) { create(:category) }

    let(:params) do
      { id: category.id }
    end

    context 'when user IS logged in' do
      let(:user) { create(:user) }
      before { sign_in(user) }
      context 'and sends valid params' do 
        it 'deletes category' do
          expect { subject }.to change(Category, :count).by(-1)
        end 
      end
    end

    context 'when NO user is logged in' do
       context 'and sends valid params' do 
        it 'deletes category' do
          expect { subject }.not_to change(Category, :count)
        end 
      end
    end
    
  end
end 
