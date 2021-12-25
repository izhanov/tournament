FactoryBot.define do
  factory :division do
    sequence(:name) { |n| "Division #{n}" }
  end
end
