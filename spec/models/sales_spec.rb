require 'rails_helper'

RSpec.describe Sale, type: :model do

  describe 'table columns' do
    it { is_expected.to have_db_column(:amount) }
    it { is_expected.to have_db_column(:client_id) }
    it { is_expected.to have_db_column(:user_id) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:sale_details) }
    it { is_expected.to belong_to(:client) }
    it { is_expected.to belong_to(:user) }
  end
end