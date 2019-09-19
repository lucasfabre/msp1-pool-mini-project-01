#!/bin/bash

# strict mode
set -euo pipefail
IFS=$'\n\t'

echo "create user"
curl -X POST \
  http://localhost:4000/api/users/ \
  -H 'Content-Type: application/json' \
  -H 'cache-control: no-cache' \
  -d '{
	"user": {
		"email": "johny@test.com",
		"username": "johny"
	}
}
' | grep '{"data":{"email":"johny@test.com","id":1,"username":"johny"}}'

echo -e "\nok"
