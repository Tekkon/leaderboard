# frozen_string_literal: true

# Updates user scores every second.
class UserScoreUpdater
  def self.perform
    loop do
      users = User.take(100)

      User.transaction do
        users.each { |user| user.update!(score: rand(150..1_000_000)) }
      end

      sleep 1.second
    end
  end
end
