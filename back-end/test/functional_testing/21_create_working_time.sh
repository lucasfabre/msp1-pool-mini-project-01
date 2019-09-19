#!/bin/bash

# strict mode
set -euo pipefail
IFS=$'\n\t'

echo "create working time"
curl -X POST \
  http://localhost:4000/api/workingtimes/1 \
  -H 'Content-Type: application/json' \
  -H 'cache-control: no-cache' \
  -d '{
	"working_time": {
		"start": "2019-09-12 09:19:59",
		"end": "2019-09-12 09:35:40"
	}
}
' | grep '{"data":{"end":"2019-09-12 09:35:40","id":1,"start":"2019-09-12 09:19:59","user":1}}'
echo -e "\nok"