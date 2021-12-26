# frozen_string_literal: true

class TeamsInDivisionsController < ApplicationController
  def new
    @teams_in_division = TeamsInDivision.new
  end

  def create
    operation = Operations::TeamsInDivisions::Add.new
    result = operation.call(params[:division_id], team_id)

    case result
    in Success
      flash[:success] = t('.success')
    in Failure[error_code, errors]
      flash[:error] = failure_resolver(operation, error_code)
    end
    redirect_to divisions_path
  end

  private

  def team_id
    params.require(:teams_in_division).permit(:team_id)
  end
end
