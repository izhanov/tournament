# frozen_string_literal: true

module Operations
  module Divisions
    class Create
      include Dry::Monads[:result, :do]

      def call(params)
        validated_params = yield validate(params)
        division = yield create(validated_params)
        Success(division)
      end

      private

      def validate(params)
        validation = Validations::Division::Create.new
        validation.call(params).to_monad
          .fmap(&:values)
          .or { |failure| Failure[:validation_error, failure.errors.to_h] }
      end

      def create(params)
        team = Division.create!(params)
        Success(team)
      rescue ActiveRecord::RecordNotUnique
        Failure[:name_not_unique, { name: ['must be unique']}]
      end
    end
  end
end
