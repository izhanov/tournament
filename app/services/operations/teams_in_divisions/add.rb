# frozen_string_literal: true

module Operations
  module TeamsInDivisions
    class Add
      include Dry::Monads[:result, :do]

      def call(division_id, team_id)
        division = yield find_division(division_id)
        team = yield find_team(team_id)
        yield add(division, team)
        Success(true)
      end

      private

      def find_division(division_id)
        division = Division.find(division_id)
        Success(division)
      rescue ActiveRecord::RecordNotFound
        Failure[:division_not_found, {}]
      end

      def find_team(team_id)
        team = Team.find(team_id)
        Success(team)
      rescue ActiveRecord::RecordNotFound
        Failure[:team_not_found, {}]
      end

      def add(division, team)
        TeamsInDivision.create!(team_id: team.id, division_id: division.id)
        Success(true)
      end
    end
  end
end
