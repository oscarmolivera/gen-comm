require 'rails_helper'

RSpec.describe 'providers routes', type: :routing do

  it { expect(get: providers_path).to route_to('providers#index') }
  
  it { expect(get: provider_path(id: '1')).to route_to('providers#show', id: '1') }

  it { expect(post: providers_path).to route_to('providers#create') }

  it { expect(get: edit_provider_path(id: '1')).to route_to('providers#edit', id: '1') }

  it { expect(patch: provider_path(id: '1')).to route_to('providers#update', id: '1') }

  it { expect(put: provider_path(id: '1')).to route_to('providers#update', id: '1') }

  it { expect(delete: provider_path(id: '1')).to route_to('providers#destroy', id: '1') }

end 