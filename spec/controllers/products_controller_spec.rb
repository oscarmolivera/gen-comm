require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  let(:user) { create(:user) }

  describe 'GET #Index' do
    context 'when user IS logged in' do
      before do
        sign_in(user)
        get :index
      end

      context 'and some products are present' do
        let!(:product) { create(:product) }

        it 'assigns @products' do
          expect(assigns(:products)).to eq([product])
        end

        it 'renders the index template' do
          expect(response).to render_template(:index)
        end
      end

      context 'and no products are present' do
        it 'does not assigns @products' do
          expect(assigns(:products)).to eq([])
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
        expect(subject).to redirect_to('/users/sign_in')
      end
    end
  end

  describe 'Get #New' do
    subject {get :new, xhr: true}
    context 'when user IS logged in' do
      let(:product) { create(:product) }
      before do
        sign_in(user)
        subject
      end
      it 'generate a new product' do
        expect(assigns(:product)).to be_a_new(Product)
      end

      it 'renders the new template' do
        expect(response).to render_template(:new)
      end
  
      it 'rendes template OK' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when NO user is logged in' do
      before { subject }
      it 'does not assign @product' do
        expect(assigns(:product)).to eq(nil)
      end

      it 'does not render the new template' do
        expect(response).not_to render_template(:new)
      end

      it 'response code:Unauthorized' do
        expect(response).to have_http_status(401)
      end
    end
  end

  describe 'Post #Create' do
    subject { post :create, params: params, xhr: true }
    let(:product) { build(:product) }
    let(:supplier) { create(:supplier) }
    let(:category) { create(:category) }

    let(:params) do
      { product:{ name: product.name,
                  description: product.description,
                  existence: product.existence,
                  price: product.price,
                  image: product.image,
                  category_id: category.id,
                  supplier_id: supplier.id
                }
      }
    end

    context 'when user IS logged in' do
      before { sign_in(user) }
      
      context 'and sends VALID params' do

        it 'creates new supplier' do
          expect { subject }.to change(Product, :count).by(1)
        end
  
        it 'method create is success' do
          subject
          expect(response).to have_http_status(:success)
        end
      end
      
      context 'and sends INVALID params' do
        let(:params) do
          { product:{ name: nil,
                      description: nil,
                      existence: nil,
                      price: nil,
                      image: nil,
                      category_id: nil,
                      supplier_id: nil
                    }
          }
        end

        it 'does not create new product' do
          expect { subject }.not_to change(Product, :count)
        end
  
        it 'response code:Unauthorized' do
          subject
          expect(response).to have_http_status(401)
        end
      end
    end

    context 'when NO user is logged in' do
      context 'and are valid params' do
        it 'does not create new product' do
          expect { subject }.not_to change(Product, :count)
        end
  
        it 'response code:Unauthorized' do
          subject
          expect(response).to have_http_status(401)
        end
      end
    end
  end
end
 