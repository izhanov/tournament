require 'rails_helper'

RSpec.describe TeamsInDivision, type: :model do
  it { is_expected.to have_db_column(:team_id).of_type(:integer) }
  it { is_expected.to have_db_column(:division_id).of_type(:integer) }
  it { is_expected.to have_db_index([:team_id, :division_id]).unique(true) }
end
