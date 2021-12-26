class Team < ApplicationRecord
  has_one :chart, class_name: 'TeamsInDivision'
  has_one :division, through: :teams_in_division
  has_many :matches, dependent: :destroy

  scope :not_in_division, -> {
    joins(%{
      LEFT JOIN teams_in_divisions ON teams_in_divisions.team_id = teams.id
      WHERE teams_in_divisions.team_id IS NULL
    })
  }

  def score_in_division
    chart.score
  end
end
