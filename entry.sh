#! /bin/sh

rake assets:precompile

crond

bundle exec rails server -b 0.0.0.0 -p 5444 -e production
