require 'rails_helper'

RSpec.describe Match, type: :model do
  it { is_expected.to belong_to(:team) }
  it { is_expected.to have_db_column(:competitor_id).of_type(:integer) }
  it { is_expected.to have_db_column(:status).of_type(:string) }
  it { is_expected.to have_db_column(:result).of_type(:string) }
end
