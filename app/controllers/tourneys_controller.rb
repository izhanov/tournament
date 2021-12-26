# frozen_string_literal: true

class TourneysController < ApplicationController
  def index
    @divisions = Division.all
  end

  def result
    operation = Operations::Tourneys::Divisions::GetResults.new
    result = operation.call(params[:division_id])

    case result
    in Success
    in Failure
    end
  end

  def play_off
    @teams = Team.ordered_by_score_in_division.first(4)
    operation = Operations::Tourneys::PlayOff::GetResults.new
    result = operation.call(@teams)

    case result
    in Success
    in Failure
    end
  end
end
