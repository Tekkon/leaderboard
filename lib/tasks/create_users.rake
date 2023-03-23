# frozen_string_literal: true

require 'faker'

desc 'create users'
task create_users: :environment do
  (1..150_000_000).each do |i|
    puts "Creating the User #{i}/150_000_000..."

    User.create!(
      name: Faker::Name.first_name,
      score: rand(150..1_000_000),
      country: Country.all.sample
    )
  end

  puts 'Done!'
end
