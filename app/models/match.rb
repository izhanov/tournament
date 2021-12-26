class Match < ApplicationRecord
  STATUSES = %w[COMPLETED CANCELED ON_TIME].freeze
  RESULTS = %w[WIN DRAW LOSE].freeze

  belongs_to :team
end
