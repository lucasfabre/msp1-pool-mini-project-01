#!/bin/bash

# strict mode
set -euo pipefail
IFS=$'\n\t'

echo "retrieving working time"
curl -X GET \
  http://localhost:4000/api/workingtimes/1/1 \
  -H 'Content-Type: application/json' \
  -H 'cache-control: no-cache' \
| grep '{"data":{"end":"2019-09-12 09:35:40","id":1,"start":"2019-09-12 09:19:59","user":1}}'

curl -X GET \
  'http://localhost:4000/api/workingtimes/1?start=2019-09-12%2009:09:59&end=2019-09-12%2009:35:40' \
  -H 'Content-Type: application/json' \
  -H 'Cache-Control: no-cache'

echo -e "\nok"