FactoryBot.define do

  sequence :email do |n|
    "person#{n}@example.com"
  end

  factory :user do
    email
    password { "asdfjkl;" }
    first_name { "Jurek" }
    last_name { "Ogorek" }
  end

  factory :user, class: "User" do
    email
    password { "asdfjkl;" }
    first_name { "Second" }
    last_name { "User" }
  end

  factory :admin_user, class: "AdminUser" do
    email
    password { "asdfjkl;" }
    first_name { "Admin" }
    last_name { "User" }
  end
end
