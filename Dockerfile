FROM ruby:2.7-alpine

RUN apk add --update nodejs nodejs-npm gcc build-base mariadb-dev sqlite-dev mariadb-connector-c-dev

WORKDIR /code
ADD ./lobsters /code

RUN bundle

ENTRYPOINT bundle exec rails server
