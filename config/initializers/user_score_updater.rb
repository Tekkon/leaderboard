# Calls UserScoreUpdater worker which updates user score every second.
# Performed only when running under rails server.
#Thread.new { UserScoreUpdater.perform } if File.basename($0) == 'rails'
