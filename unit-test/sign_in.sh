curl -X POST \
  http://ec2-13-59-172-229.us-east-2.compute.amazonaws.com:80/api/sign_in \
  -H 'Content-Type: application/json' \
  -H 'Postman-Token: 5c7f31cf-221d-42f4-b0df-6de31beafee6,052a80bf-98d0-46d4-a632-799d2778d2bb' \
  -H 'cache-control: no-cache,no-cache' \
  -d '{
        "email": "mathilde.chabeau@epitech.eu",
        "password": "plop"
}' --trace-ascii dumps.txt
