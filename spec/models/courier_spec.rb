require 'rails_helper'

RSpec.describe Courier, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:packages) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_length_of(:email).is_at_most(255) }
    it { is_expected.to allow_value('john@doe.com').for(:email) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  end

  describe 'columns' do

  end

end
