require 'rails_helper'

RSpec.describe Airport, type: :model do
  context 'testing Airport model validation' do  
    before do
      byebug
      country = Country.find_by(name: 'France')
      airport = Airport.create(country_id: country.id,
                                  city: Faker::Address.city,
                                  name: Faker::Name.unique.name,
                                  code: [*'A'..'Z'].sample(3).join)
    end

    it 'belongs to a Country' do
      expect(Airport.country).to be(country)
    end
  end
end
