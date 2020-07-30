require 'rails_helper'

RSpec.describe 'Suppliers Routes', type: :routing do

  it { expect(get: suppliers_path).to route_to('suppliers#index') }
  
  it { expect(get: supplier_path(id: '1')).to route_to('suppliers#show', id: '1') }

  it { expect(post: suppliers_path).to route_to('suppliers#create') }

  it { expect(get: edit_supplier_path(id: '1')).to route_to('suppliers#edit', id: '1') }

  it { expect(patch: supplier_path(id: '1')).to route_to('suppliers#update', id: '1') }

  it { expect(put: supplier_path(id: '1')).to route_to('suppliers#update', id: '1') }

  it { expect(delete: supplier_path(id: '1')).to route_to('suppliers#destroy', id: '1') }

end 