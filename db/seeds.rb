# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'DEFAULT USERS'
["pushups", "situps", "body_weight_squats", "one_mile_run"].each {|s| Exercise.find_or_create_by(name: s) }
puts "Created initial 3 exercises"
user = User.find_or_create_by_email :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
puts 'user: ' << user.name
puts "Seeding muscle group data"
["Abdominal", "Biceps", "Deltoids", "Erector Spinae", "Gastrocnemius and Soleus", "Gluteus", "Hamstrings", "Latissimus Dorsi", "Rhomboids", "Obliques", "Pectoralis", "Quadriceps", "Trapezius", "Triceps"].each do |mg|
  MuscleGroup.find_or_create_by(name: mg)
end

puts "Seeding goal data"

["Get stronger", "Get faster", "Slim down", "Lose baby weight", "Bulk Up", "Tone up", "Get started"].each do |g|
  Goal.find_or_create_by(name: g)
end

