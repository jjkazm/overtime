FactoryBot.define do
  factory :user do
    email { "asdf@user.com" }
    password { "password" }
    first_name { "Jurek" }
    last_name { "Ogorek" }
  end
end
