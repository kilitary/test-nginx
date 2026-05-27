#!/usr/bin/env bash
set -euo pipefail

BASE_URL="http://localhost:8081"

echo "=== Тест 1: чистый запрос ==="
curl -s -i "$BASE_URL/" | grep -i "X-Forwarded-For"

echo "=== Тест 2: попытка подмены X-Forwarded-For ==="
curl -s -i -H "X-Forwarded-For: 1.2.3.4,5.6.7.8" "$BASE_URL/" | grep -i "X-Forwarded-For"

echo "=== Тест 3: пользовательский Host и X-Real-IP ==="
curl -s -i -H "Host: my.test" -H "X-Real-IP: 9.9.9.9" "$BASE_URL/" | grep -i -E "Host:|X-Real-Ip:|X-Forwarded-For:"

echo "=== Тест 4: запрос напрямую к proxy2 ==="
curl -s -i "http://localhost:8082/" | grep -i "X-Forwarded-For"

echo "=== Тест 5: запрос напрямую к proxy3 ==="
curl -s -i "http://localhost:8083/" | grep -i "X-Forwarded-For"
