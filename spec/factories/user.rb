FactoryBot.define do
  factory :user do
    email { "asdf@user.com" }
    password { "asdfjkl;" }
    first_name { "Jurek" }
    last_name { "Ogorek" }
  end

  factory :admin_user, class: "AdminUser" do
    email { "second@user.com" }
    password { "asdfjkl;" }
    first_name { "Second" }
    last_name { "User" }
  end
end
