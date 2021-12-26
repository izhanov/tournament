class Division < ApplicationRecord
  has_many :teams_in_divisions
  has_many :teams, through: :teams_in_divisions
  has_many :tourneys
end
