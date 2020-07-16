require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  
  describe 'GET index' do
    before { get :index }

    context 'when some categories present' do
      let!(:category) { create(:category) } 

      it 'assigns @categories' do
        expect(assigns(:categories)).to eq([category])
      end

      it 'renders the index template' do
        expect(response).to render_template(:index)
      end
    end

    context 'when no categories' do
      it 'assigns @categories' do
        expect(assigns(:categories)).to eq([])
      end

      it 'renders the index template' do
        expect(response).to render_template(:index)
      end
    end
  end

  describe 'GET new' do

    before { get :new, xhr: true }

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

  describe 'POST create' do
    subject { post :create, params: params, xhr: true }
    let(:category) { build(:category) }
  
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

  describe 'GET show' do
    # no needed in this case
  end

  describe 'GET edit' do
    subject { get :edit, params: params, xhr: true }
    context 'when params are valid' do
      let(:params) { { id: category.id } }

      let!(:category) { create(:category) }

      before { subject }

      it 'assigns @category' do
        expect(assigns(:category)).to eq(category)
      end

      it 'renders the edit template' do
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'PUT update' do
    subject { put :update, params: params, xhr: true }

    let!(:category) { create(:category) }

    context 'valid params' do
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

    context 'invalid params' do
      let(:params) do
        { id: category.id, category: { name: nil, description: nil  } }
      end

      it 'does not update category' do
        subject
        expect(response).to have_http_status(405)
      end
    end
    
  end

  describe 'DELETE destroy' do
    subject { delete :destroy, params: params, xhr: true }

    let!(:category) { create(:category) }

    context 'valid params' do
      let(:params) do
        { id: category.id }
      end

      it 'deletes category' do
        expect { subject }.to change(Category, :count).by(-1)
      end 
    end
  end
end 
