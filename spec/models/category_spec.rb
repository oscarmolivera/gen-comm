require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'table columns' do
    it { is_expected.to have_db_column(:name) }
    it { is_expected.to have_db_column(:description) }
  end
end
