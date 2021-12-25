# frozen_string_literal: true

class DivisionsController < ApplicationController
  def index
    @divisions = Division.all
  end

  def create
    operation = Operations::Divisions::Create.new
    result = operation.call(division_params.to_h)

    case result
    in Success
      flash[:success] = t('.success')
    in Failure[error_code, errors]
      flash[:error] = failure_resolver(operation, error_code)
    end
    redirect_to divisions_path
  end

  private

  def division_params
    params.require(:division).permit(:name)
  end
end
