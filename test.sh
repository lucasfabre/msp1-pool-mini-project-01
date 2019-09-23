curl -X POST \
  http://ec2-18-223-111-157.us-east-2.compute.amazonaws.com:4000/api/users/ \
  -H 'Content-Type: application/json' \
  -H 'Postman-Token: a7036f44-e4b7-4494-9d04-4af687c54d5e' \
  -H 'cache-control: no-cache,no-cache' \
  -d '{
    "user": {
        "email": "mathilde.chabeau@epitech.eu",
        "firstname": "Mathilde",
        "lastname": "Chabeau",
        "password": "plop",
        "roles": 0
    }
}' --trace-ascii dumps.txt
