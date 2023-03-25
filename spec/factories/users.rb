# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { "#{Faker::Name.first_name} #{Faker::Name.last_name}" }
    score { rand(150..1_000_000) }
    country
  end
end
