# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

teams = 16.times { Team.create!(name: Faker::Team.unique.name) }



division_a = Division.create!(name: Faker::Space.unique.star_cluster)
division_b = Division.create!(name: Faker::Space.unique.star_cluster)

Team.all.pluck(:id).select(&:even?).each do |team_id|
  division_a.teams_in_divisions.create!(team_id: team_id)
end

Team.all.pluck(:id).select(&:odd?).each do |team_id|
  division_b.teams_in_divisions.create!(team_id: team_id)
end
