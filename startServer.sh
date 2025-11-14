#!/bin/bash
set -e

# Start Rails server in production
RAILS_ENV=production rails db:migrate
RAILS_ENV=production rails server -b 0.0.0.0 -p 3000
