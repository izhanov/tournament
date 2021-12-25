class Team < ApplicationRecord
  has_one :teams_in_division
  has_one :division, through: :teams_in_division

  scope :not_in_division, -> {
    joins(%{
      LEFT JOIN teams_in_divisions ON teams_in_divisions.team_id = teams.id
      WHERE teams_in_divisions.team_id IS NULL
    })
  }
end
