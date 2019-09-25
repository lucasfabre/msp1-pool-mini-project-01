curl -X POST \
  http://ec2-13-59-172-229.us-east-2.compute.amazonaws.com:4000/api/sign_up \
  -H 'Content-Type: application/json' \
  -H 'Postman-Token: a7036f44-e4b7-4494-9d04-4af687c54d5e' \
  -H 'cache-control: no-cache,no-cache' \
  -d '{
    "user": {
        "email": "nouveauTest@test.gr",
        "firstname": "Mathilde",
        "lastname": "Chabeau",
        "password": "plop",
        "roles": 0
    }
}' --trace-ascii dumps.txt | jq ".data.id" > id_user && cat id_user