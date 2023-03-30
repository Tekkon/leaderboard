#!/usr/bin/env bash

cd /usr/src/app

RAILS_ENV=production bundle exec rake db:create
RAILS_ENV=production bundle exec rake db:migrate

# Do some protective cleanup
> log/production.log
rm -f tmp/pids/server.pid

bundle exec rails server -e production -b 0.0.0.0 -p $PORT

RAILS_ENV=production bundle exec sidekiq -C config/sidekiq.yml
