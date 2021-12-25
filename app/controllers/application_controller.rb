# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Dry::Monads::Result::Mixin

  private

  def failure_resolver(operation, error_code)
    path = operation.class.to_s.split("::").map(&:underscore).join(".")
    exceptions_path = "errors.#{path}"
    t("#{exceptions_path}.#{error_code}")
  end
end
