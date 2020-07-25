require 'rails_helper'

RSpec.describe 'Clients routes', type: :routing do

  it { expect(get: clients_path).to route_to('clients#index') }
  
  it { expect(get: client_path(id: '1')).to route_to('clients#show', id: '1') }

  it { expect(post: clients_path).to route_to('clients#create') }

  it { expect(get: edit_client_path(id: '1')).to route_to('clients#edit', id: '1') }

  it { expect(patch: client_path(id: '1')).to route_to('clients#update', id: '1') }

  it { expect(put: client_path(id: '1')).to route_to('clients#update', id: '1') }

  it { expect(delete: client_path(id: '1')).to route_to('clients#destroy', id: '1') }

end