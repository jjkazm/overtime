FactoryBot.define do
  factory :post do
    date { "2019-04-27" }
    rationale { "MyText" }
    user
  end
end
