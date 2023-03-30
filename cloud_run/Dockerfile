# syntax=docker/dockerfile:1
FROM ruby:3.0.2-alpine
RUN apk add --update --no-cache postgresql-dev bash build-base ruby-dev coreutils \
                                libxml2-dev libxslt-dev libffi-dev gcompat tzdata sudo
WORKDIR /usr/src/app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

# Set Google App Credentials environment variable with Service Account
ENV GOOGLE_APPLICATION_CREDENTIALS=/usr/src/app/config/leaderboard_runner.key

ARG DB_PWD
ARG POSTGRES_POOL
ARG POSTGRES_USERNAME
ARG REDIS_URL_SIDEKIQ
ARG REDIS_PORT_RAILS
ARG REDIS_DB_RAILS
ARG REDIS_CONNECTION_POOL
ARG REDIS_TIMEOUT
ARG SIDEKIQ_USER
ARG SIDEKIQ_PASSWORD
ARG REDIS_PASSWORD
ENV DATABASE_PASSWORD=${DB_PWD}

# For now we don't have a Nginx/Apache frontend so tell
# the Puma HTTP server to serve static content
# (e.g. CSS and Javascript files)
ENV RAILS_SERVE_STATIC_FILES=true

# Redirect Rails log to STDOUT for Cloud Run to capture
ENV RAILS_LOG_TO_STDOUT=true

ENV POSTGRES_POOL=${POSTGRES_POOL}
ENV POSTGRES_USERNAME=${POSTGRES_USERNAME}
ENV ADMIN_PASSWORD=${ADMIN_PASSWORD}
ENV REDIS_URL_SIDEKIQ=${REDIS_URL_SIDEKIQ}
ENV REDIS_PORT_RAILS=${REDIS_PORT_RAILS}
ENV REDIS_DB_RAILS=${REDIS_DB_RAILS}
ENV REDIS_CONNECTION_POOL=${REDIS_CONNECTION_POOL}
ENV REDIS_TIMEOUT=${REDIS_TIMEOUT}
ENV SIDEKIQ_USER=${SIDEKIQ_USER}
ENV SIDEKIQ_PASSWORD=${SIDEKIQ_PASSWORD}
ENV REDIS_PASSWORD=${REDIS_PASSWORD}

RUN chmod +x /usr/src/app/entrypoint.sh
ENTRYPOINT ["/usr/src/app/entrypoint.sh"]
