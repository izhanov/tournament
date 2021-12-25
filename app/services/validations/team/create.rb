# frozen_string_literal: true

module Validations
  module Team
    class Create < Validations::Base
      params do
        required(:name).filled(:string)
      end
    end
  end
end
