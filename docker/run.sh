#!/bin/bash -x

# pull a copy of dashing if it doesn't already exist
if [[ ! -e /dashing/config.ru ]]; then
  git clone 'https://github.com/eljefe80/openhab-dashboard.git' /dashing
fi

# install gems
cd /dashing
bundle install

if [[ ! -z "$PORT" ]]; then
  PORT_ARG="-p $PORT"
fi

# Start dashing
exec dashing start $PORT_ARG
