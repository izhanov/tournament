# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Operations::TeamsInDivisions::Add do
  describe '#call' do
    context 'when division not found' do
      let(:team) { create(:team) }

      it 'returns failure :division_not_found' do
        result = subject.call(1, team.id)
        expect(result).to be_a(Dry::Monads::Failure)
        expect(result.failure).to match_array([:division_not_found, {}])
      end
    end

    context 'when team not found' do
      let(:division) { create(:division) }

      it 'returns failure :team_not_found' do
        result = subject.call(division.id, 2)
        expect(result).to be_a(Dry::Monads::Failure)
        expect(result.failure).to match_array([:team_not_found, {}])
      end
    end

    context 'when division & team exists' do
      let(:division) { create(:division) }
      let(:team) { create(:team) }

      it 'returns failure :team_not_found' do
        result = subject.call(division.id, team.id)
        expect(result).to be_a(Dry::Monads::Success)
        expect(result.value!).to eq true
      end
    end
  end
end
