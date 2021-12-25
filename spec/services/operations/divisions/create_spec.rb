# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Operations::Divisions::Create do
  describe '#call' do
    context 'when params incorrect' do
      it 'returns failure' do
        result = subject.call({})
        expect(result).to be_a(Dry::Monads::Failure)
        expect(result.failure).to match_array([:validation_error, { name: ['is missing'] }])
      end
    end

    context 'when params correct' do
      it 'returns team' do
        result = subject.call({name: 'Division A' })
        expect(result).to be_a(Dry::Monads::Success)
        expect(result.value!).to be_a(Division)
      end
    end

    context 'when name of team not unique' do
      let!(:team) { create(:division) }

      it 'returns :name_not_unique failure' do
        result = subject.call({name: team.name })
        expect(result).to be_a(Dry::Monads::Failure)
        expect(result.failure).to match_array([:name_not_unique, { name: ['must be unique'] }])
      end
    end
  end
end
