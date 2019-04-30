FactoryBot.define do
  factory :post do
    date { Date.today }
    rationale { "MyText" }
    user
  end

  factory :second_post, class: "Post" do
    date { Date.yesterday }
    rationale { "Second_rationale"}
    user
  end
end
