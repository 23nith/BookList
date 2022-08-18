FactoryBot.define do
  factory :list_item do
    book { nil }
    user { nil }
    rating { 1 }
    notes { "MyText" }
    start_date { "2022-08-18" }
    finish_date { "2022-08-18" }
  end
end
