#!/usr/bin/env bash
echo "┏━━━ 🧩 API REPORT: $(pwd) ━━━━━━━━━━━━━━━━━━━━━"
# without --local fail unless be updated
yarn api-extractor run --local
