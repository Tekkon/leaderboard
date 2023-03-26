# frozen_string_literal: true

# Updates user scores every second.
class UserScoreUpdater
  include Sidekiq::Worker

  NR_USERS = 100
  SCORE_CHANGE = 1000
  MAX_SCORE = 1_000_000
  MIN_SCORE = 150

  def perform
    loop do
      users = User.take(NR_USERS)

      User.transaction do
        users.each do |user|
          multiplier = rand(2) == 0 ? -1 : 1
          new_score = user.score + SCORE_CHANGE * multiplier
          new_score = MIN_SCORE if new_score < MIN_SCORE
          new_score = MAX_SCORE if new_score > MAX_SCORE

          user.update!(score: new_score)
        end
      end

      sleep 1.second
    end
  end
end
