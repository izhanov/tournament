require 'rails_helper'

RSpec.describe Division, type: :model do
  it { is_expected.to have_db_column(:name).of_type(:string) }
  it { is_expected.to have_db_index(:name).unique(true) }
end
