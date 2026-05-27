
echo "=== Тест 1: чистый запрос ==="
curl -s -i "http://localhost:8081/"

echo "=== Тест 2: попытка подмены X-Forwarded-For ==="
curl -s -i -H "X-Forwarded-For: 1.2.3.4,5.6.7.8" "http://localhost:8081/"

echo "=== Тест 3: пользовательский Host и X-Real-IP ==="
curl -s -i -H "Host: my.test" -H "X-Real-IP: 9.9.9.9" "http://localhost:8081/"

echo "=== Тест 4: запрос напрямую к proxy2 ==="
curl -s -i "http://localhost:8082/"

echo "=== Тест 5: запрос напрямую к proxy3 ==="
curl -s -i "http://localhost:8083/"

sleep 100
