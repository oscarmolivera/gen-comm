require 'rails_helper'

RSpec.describe 'Products Routes', type: :routing do

  it { expect(get: products_path).to route_to('products#index') }

  it { expect(get: product_path(id: 1)).to route_to('products#show', id: '1') }

  it { expect(get: new_product_path(id: 1)).to route_to('products#new', id: '1') }
  
  it { expect(post: products_path).to route_to('products#create') }

  it { expect(get: edit_product_path(id: 1)).to route_to('products#edit', id: '1') }

  it { expect(patch: product_path(id: 1)).to route_to('products#update', id: '1') }

  it { expect(put: product_path(id: 1)).to route_to('products#update', id: '1') }

  it { expect(delete: product_path(id: 1)).to route_to('products#destroy', id: '1')}

end
