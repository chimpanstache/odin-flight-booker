require 'rails_helper'

RSpec.describe Booking, type: :model do
  describe 'Booking model relationship' do
    it { is_expected.to have_many(:passengers).class_name('User') }
    it { is_expected.to have_many(:passengers).through(:informations).class_name('User').with_foreign_key(:passenger_id) }
    it { is_expected.to have_many(:informations).inverse_of(:booking) }
    it { is_expected.to belong_to(:flight).class_name('Flight') }
  end
end
