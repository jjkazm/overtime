3.times do |user|
  User.create( first_name: "Jurek no#{user}", last_name: "Ogorek",
               email: "juras#{user}@wp.pl", password: "asdfjkl;",
               password_confirmation: "asdfjkl;")
end
puts "3 users has been created"
User.all.each do |user|
  30.times do |post|
    Post.create(date: Date.today, rationale: "Rationale of #{user.first_name} number #{post}", user_id: user.id)
  end
end
puts "100 posts has been created."
