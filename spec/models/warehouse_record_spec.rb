require 'rails_helper'

RSpec.describe WarehouseRecord, type: :model do
  describe 'table columns' do
    it { is_expected.to have_db_column(:quantity) }
    it { is_expected.to have_db_column(:supplier_id) }
    it { is_expected.to have_db_column(:product_id) }
    it { is_expected.to have_db_column(:user_id) }
  end

  describe 'associations' do
   
  end
end