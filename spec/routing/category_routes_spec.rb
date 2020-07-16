require 'rails_helper'

RSpec.describe 'Category routes', type: :routing do

  it { expect(get: categories_path).to route_to('categories#index') }
  
  it { expect(get: category_path(id: '1')).to route_to('categories#show', id: '1') }

  it { expect(post: categories_path).to route_to('categories#create') }

  it { expect(get: edit_category_path(id: '1')).to route_to('categories#edit', id: '1') }

  it { expect(patch: category_path(id: '1')).to route_to('categories#update', id: '1') }

  it { expect(put: category_path(id: '1')).to route_to('categories#update', id: '1') }

  it { expect(delete: category_path(id: '1')).to route_to('categories#destroy', id: '1') }

end
