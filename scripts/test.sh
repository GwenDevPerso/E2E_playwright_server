#!/bin/bash

set -e

echo "🚀 Running Playwright tests..."

# 1. run tests
docker compose run --rm playwright

echo "✅ Tests finished"

# 2. ensure report exists
if [ ! -f "./playwright-report/index.html" ]; then
  echo "❌ No report found"
  exit 1
fi

echo "📊 Starting report server..."

# 3. restart nginx report
docker compose up -d report

echo "🌍 Report available at:"
echo "http://$(hostname -I | awk '{print $1}'):8080"