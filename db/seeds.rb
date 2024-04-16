(1..10).each do |i|
  user = User.create(
    email: Faker::Internet.email,
    first_name: Faker::Name.first_name,
    password: 'password',
    password_confirmation: 'password'
  )

  rand(1..10).times do
    user.workouts.create(workout_name: Faker::Lorem.sentence, sets: rand(1..10), reps: rand(1..10), calories_burned: rand(1..1000))
    user.foods.create(food_name: Faker::Lorem.sentence, calories: rand(1..1000))
    user.waters.create(ounces: rand(1..100))
  end
end
