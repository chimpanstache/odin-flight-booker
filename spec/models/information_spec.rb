require 'rails_helper'

RSpec.describe Information, type: :model do
  describe 'Information model relationship' do
    it { is_expected.to belong_to(:booking).class_name('Booking') }
    it { is_expected.to belong_to(:passenger).class_name('User').with_foreign_key(:passenger_id) }
  end
end
