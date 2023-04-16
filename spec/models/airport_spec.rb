require 'rails_helper'

RSpec.describe Airport, type: :model do
  describe 'Airport model relationship' do
    it { is_expected.to belong_to(:country).class_name('Country') }
    it { is_expected.to have_many(:arrivals).class_name('Flight').with_foreign_key(:arrival_id) }
    it { is_expected.to have_many(:departures).class_name('Flight').with_foreign_key(:departure_id) }
  end
end
