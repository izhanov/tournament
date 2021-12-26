FactoryBot.define do
  factory :match do
    team { nil }
    competitor_id { 1 }
    status { "MyString" }
    result { "MyString" }
  end
end
