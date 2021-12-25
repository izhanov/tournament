# frozen_string_literal: true

module Validations
  class Base < Dry::Validation::Contract
    Dry::Validation.load_extensions(:monads)
    config.messages.backend = :i18n
  end
end
