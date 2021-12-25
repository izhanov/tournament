FactoryBot.define do
  factory :teams_in_division do
    team_id
    division_id
    score { 0 }
  end
end
