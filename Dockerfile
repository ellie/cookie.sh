FROM ruby:2.7-alpine

RUN apk add --update nodejs nodejs-npm gcc build-base mariadb-dev sqlite-dev mariadb-connector-c-dev

WORKDIR /code

ADD ./crontab /code/crontab
RUN crontab /code/crontab

ADD ./lobsters/Gemfile /code
ADD ./lobsters/Gemfile.lock /code

RUN bundle install

ADD ./lobsters /code

ADD ./entry.sh /code/entry.sh
RUN chmod +x entry.sh

ENTRYPOINT ["sh", "/code/entry.sh"]
