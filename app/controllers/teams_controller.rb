# frozen_string_literal: true

class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def create
    operation = Operations::Teams::Create.new
    result = operation.call(team_params.to_h)

    case result
    in Success
      flash[:success] = t('.success')
    in Failure[error_code, errors]
      flash[:error] = failure_resolver(operation, error_code)
    end
    redirect_to teams_path
  end

  private

  def team_params
    params.require(:team).permit(:name)
  end
end
