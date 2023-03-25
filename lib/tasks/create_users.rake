# frozen_string_literal: true

require 'faker'

desc 'create users'
task create_users: :environment do
  NR_CORES = Etc.nprocessors
  NR_USERS = 150_000_000 - User.count
  NR_PART = NR_USERS / NR_CORES
  PARTITIONS = (1..NR_CORES).map { |i| ((i - 1) * NR_PART + 1)..(NR_PART * i) }
  MAX_COUNTRY_ID = Country.count
  BATCH_SIZE = 10_000

  NR_CORES.times.map do |i|
    fork do
      partition = PARTITIONS[i]
      records = []

      puts "Generating users from #{partition.first} to #{partition.last}..."

      partition.each do
        records << {
          name: "#{Faker::Name.first_name} #{Faker::Name.last_name}",
          score: rand(150..1_000_000),
          country_id: rand(1..MAX_COUNTRY_ID),
          created_at: Time.now.utc,
          updated_at: Time.now.utc
        }

        if records.count >= BATCH_SIZE
          User.insert_all(records)
          records = []
          puts "#{User.count} users created..."
        end
      end

      unless records.empty?
        User.insert_all(records)
        puts "#{User.count} users created..."
      end
    end
  end

  Process.waitall

  puts 'Done!'
end
