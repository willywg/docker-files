#!/bin/bash

echo '----Starting Web Aplication----'

rm /app/tmp/pids/server.pid
bundle exec rails server --port 3000 --binding 0.0.0.0
