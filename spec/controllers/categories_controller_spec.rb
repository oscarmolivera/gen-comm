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
end 
