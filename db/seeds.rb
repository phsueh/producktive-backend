# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



salt = BCrypt::Engine::generate_salt
password_digest = BCrypt::Engine::hash_secret('abc123', salt)


first_user = User.create!(
    name: Faker::Name.name, 
    username: Faker::Internet.email, 
    password_digest: password_digest, 
    quote: "I have no special talents. I am only passionately curious. - Albert Einstein"
    )


category = ["Personal", "Work", "Family", "Social", "Aspiring", "Education", "Fitness", "Leisure", "Professional Development"]
category.each do |category|
  Category.create(
      name: category, 
      duration: rand(1..8), 
      user_id: User.ids.sample
      )
end

10.times do 
    Goal.create(
        name: Faker::Lorem.sentence(word_count: 2, supplemental: true, random_words_to_add: 2),
        start_date: Faker::Date.in_date_period,
        end_date: Faker::Date.in_date_period,
        status_complete: false,
        category_id: Category.ids.sample
    )

end

10.times do
    Task.create(
        name: "Task", 
        description: "Get this one done today!",
        priority: "", 
        difficulty: "", 
        start_date: Faker::Date.in_date_period,
        end_date: Faker::Date.in_date_period,
        status_complete: false, 
        duration: rand(1..8),
        taskable_type: "Goal",
        taskable_id: Goal.ids.sample,
        user_id: User.ids.sample
        )
end

puts "Done!"