# Calls UserScoreUpdater worker which updates user score every second.
Sidekiq::Queue.all.map(&:clear)
UserScoreUpdater.perform_async
