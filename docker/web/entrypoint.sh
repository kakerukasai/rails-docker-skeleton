#!/bin/bash

set -e

# # Remove a potentially pre-existing server.pid for Rails.
# rm -f /app/tmp/pids/*.pid

# ruby -v
# bundle config set force_ruby_platform true  # to avoid using pre-compiled nokogiri that causes an error
# bundle install -j3

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
