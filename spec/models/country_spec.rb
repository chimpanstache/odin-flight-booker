require 'rails_helper'

RSpec.describe Country, type: :model do
  describe 'testing Airport model validation' do
    it { is_expected.to have_many(:airports).class_name('Airport').with_foreign_key(:country_id) }
  end
end
