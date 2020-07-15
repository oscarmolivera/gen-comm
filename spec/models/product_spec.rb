require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'table columns' do
    it { is_expected.to have_db_column(:name) }
    it { is_expected.to have_db_column(:description) }
    it { is_expected.to have_db_column(:existence) }
    it { is_expected.to have_db_column(:price) }
    it { is_expected.to have_db_column(:image) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:supplier) }
    it { is_expected.to belong_to(:category) }
  end
end
