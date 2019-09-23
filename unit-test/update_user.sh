curl -X PUT \
  http://ec2-18-223-111-157.us-east-2.compute.amazonaws.com:4000/api/users/2 \
  -H 'Content-Type: application/json' \
  -H 'Postman-Token: 610e5afc-dec6-40c2-9ccd-2b23ad8ab6b4' \
  -H 'cache-control: no-cache' \
  -d '{
    "user": {
        "email": "changement@adresse.eu",
        "firstname": "Mathilde",
        "lastname": "Chabeau",
        "password": "plop",
        "roles": 0
    }
}'
