require 'rails_helper'

RSpec.describe Supplier, type: :model do
  describe 'table columns' do
    it { is_expected.to have_db_column(:name) }
    it { is_expected.to have_db_column(:email) }
    it { is_expected.to have_db_column(:address) }
    it { is_expected.to have_db_column(:telephone) }
    it { is_expected.to have_db_column(:photo) }
  end
end
