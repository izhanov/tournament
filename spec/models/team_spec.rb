require 'rails_helper'

RSpec.describe Team, type: :model do
  it { is_expected.to have_db_column(:name).of_type(:string) }
  it { is_expected.to have_db_index(:name).unique(true) }
  it { is_expected.to have_many(:matches) }

  describe 'Scopes' do
    describe '.not_in_division' do
      let!(:team_a) { create(:team) }
      let!(:team_b) { create(:team) }
      let!(:team_c) { create(:team) }

      let!(:division) { create(:division) }

      before do
        TeamsInDivision.create!(team_id: team_a.id, division_id: division.id)
        TeamsInDivision.create!(team_id: team_b.id, division_id: division.id)
      end

      it 'returns all teams that not in any division' do
        expect(Team.not_in_division).to match_array([team_c])
      end
    end
  end
end
