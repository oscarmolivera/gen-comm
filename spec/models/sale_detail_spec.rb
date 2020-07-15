require 'rails_helper'

RSpec.describe SaleDetail, type: :model do

  describe 'table columns' do
    it { is_expected.to have_db_column(:quantity) }
    it { is_expected.to have_db_column(:sale_id) }
    it { is_expected.to have_db_column(:product_id) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:sale) }
    it { is_expected.to belong_to(:product) }
  end
end
