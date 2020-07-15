require 'rails_helper'

RSpec.describe Supplier, type: :model do
  describe 'table columns' do
    it { is_expected.to have_db_column(:name) }
    it { is_expected.to have_db_column(:email) }
    it { is_expected.to have_db_column(:address) }
    it { is_expected.to have_db_column(:telephone) }
    it { is_expected.to have_db_column(:photo) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:products) }
    it { is_expected.to have_many(:warehouse_records) }
  end
end
 