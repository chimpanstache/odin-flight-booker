require 'rails_helper'

RSpec.describe Flight, type: :model do
  describe 'Flight model relationship' do
    it { is_expected.to belong_to(:departure).class_name('Airport').with_foreign_key(:departure_id) }
    it { is_expected.to belong_to(:arrival).class_name('Airport').with_foreign_key(:arrival_id) }
  end

  describe '#research' do
    let(:flight) { create(:flight) }

    it 'returns matching flights' do
      searched_flight = Flight.research(flight.departure_id, flight.arrival_id, flight.time)
      expect(searched_flight).to eq([flight])
    end

    context 'when there is no matching flight' do
      it 'returns an empty array' do
        expect(Flight.research(1, 1, 2.weeks.ago)).to eq([])
      end
    end
  end
end
