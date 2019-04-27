100.times do |post|
  Post.create(date: Date.today, rationale: "Post number #{post}")
end
puts "100 posts has been created."
