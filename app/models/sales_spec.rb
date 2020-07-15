require 'rails_helper'

RSpec.describe Sales, type: :model do

  describe 'table columns' do
    it { is_expected.to have_db_column(:amount)}
    it { is_expected.to have_db_column(:client_id)}
    it { is_expected.to have_db_column(:user_id)}
  end
end