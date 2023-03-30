# syntax=docker/dockerfile:1
FROM ruby:3.0.2-alpine
RUN apk add --update --no-cache postgresql-dev bash build-base ruby-dev coreutils \
                                libxml2-dev libxslt-dev libffi-dev gcompat tzdata
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
COPY . /myapp

COPY entrypoint.sh /exe/entrypoint.sh
RUN chmod +x /exe/entrypoint.sh
ENTRYPOINT ["/exe/entrypoint.sh"]
CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]
