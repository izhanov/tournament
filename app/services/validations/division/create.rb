# frozen_string_literal: true

module Validations
  module Division
    class Create < Validations::Base
      params do
        required(:name).filled(:string)
      end
    end
  end
end
