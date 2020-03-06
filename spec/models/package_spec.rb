require 'rails_helper'

RSpec.describe Package, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:courier) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:tracking_number) }
    it { is_expected.to validate_length_of(:tracking_number).is_at_most(15) }
    it { is_expected.to have_db_column(:delivery_status).of_type(:boolean) }
  end

  describe 'columns' do
    it { is_expected.to have_db_column(:tracking_number).of_type(:string) }
    it { is_expected.to have_db_column(:delivery_status).of_type(:boolean) }
  end
end
