curl -X PUT \
  http://locahost:4000/api/users/2 \
  -H 'Content-Type: application/json' \
  -H 'Postman-Token: 610e5afc-dec6-40c2-9ccd-2b23ad8ab6b4' \
  -H 'cache-control: no-cache' \
  -H 'session_jwt: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJKb2tlbiIsImV4cCI6MTU2OTMyNDg5MSwiaWF0IjoxNTY5MzE3NjkxLCJpc3MiOiJKb2tlbiIsImp0aSI6IjJuM2xjODFiMWdndWhodG1vZzAwMDBsMyIsIm5iZiI6MTU2OTMxNzY5MSwidXNlcl9pZCI6IjIxIn0.RJ650p1TEjtaJnuQhhexDM_u_o7N9aYPk6G2dxkSe5A' \
  -d '{
    "user": {
        "email": "changement@gmail.eu",
        "firstname": "Mathilde",
        "lastname": "Chabeau",
        "password": "plop",
        "roles": 0
    }
}'
