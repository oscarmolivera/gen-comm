require 'rails_helper'

RSpec.describe Client, type: :model do
  describe 'table columns' do
    it { is_expected.to have_db_column(:name) }
    it { is_expected.to have_db_column(:email) }
    it { is_expected.to have_db_column(:address) }
    it { is_expected.to have_db_column(:telephone) }
  end
end