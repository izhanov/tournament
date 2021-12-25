# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Dry::Monads::Result::Mixin
end
