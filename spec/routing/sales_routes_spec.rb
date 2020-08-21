require 'rails_helper'

RSpec.describe 'Sales Controller', type: :routing do

  it { expect(get: sales_path).to route_to('sales#index') }

  it { expect(get: sale_path(id: 1)).to route_to('sales#show', id: '1') }

  it { expect(get: new_sale_path(id: 1)).to route_to('sales#new', id: '1') }
  
  it { expect(post: sales_path).to route_to('sales#create') }

  it { expect(get: edit_sale_path(id: 1)).to route_to('sales#edit', id: '1') }

  it { expect(patch: sale_path(id: 1)).to route_to('sales#update', id: '1') }

  it { expect(put: sale_path(id: 1)).to route_to('sales#update', id: '1') }

  it { expect(delete: sale_path(id: 1)).to route_to('sales#destroy', id: '1')}
end
