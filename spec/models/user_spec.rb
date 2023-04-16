require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User model relationship' do
    it { is_expected.to have_many(:bookings).through(:informations) }
  end
end
