#!/bin/sh

APIS="http://db/ http://be/ http://fe/"

echo "Inizio test API..."

for URL in $APIS; do
  echo "Testing: $URL"
  RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" "$URL")

  if [ "$RESPONSE" -eq 200 ]; then
    echo "API $URL OK"
  else
    echo "API $URL FAILED con codice $RESPONSE"
  fi
done

echo "Test API completato."
