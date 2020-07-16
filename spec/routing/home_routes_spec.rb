require 'rails_helper'

RSpec.describe 'HOME Routes', type: :routing do
  it 'ROOT_PATH should route to Index' do
    expect(get: root_path).to route_to('homes#index')
  end
end