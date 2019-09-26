curl -X POST \
  http://ec2-13-59-172-229.us-east-2.compute.amazonaws.com:80/api/clocks/$(cat id_user) \
  -H 'Content-Type: application/json' \
  -H 'Postman-Token: 19a94fe7-b9ad-488d-bdb1-842e755b4c29' \
  -H 'cache-control: no-cache,no-cache' \
  -H 'session_jwt: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJKb2tlbiIsImV4cCI6MTU2OTQxNDE0NiwiaWF0IjoxNTY5NDA2OTQ2LCJpc3MiOiJKb2tlbiIsImp0aSI6IjJuM3FlamI3bHNqaTc1ZzFlYzAwMDEyaCIsIm5iZiI6MTU2OTQwNjk0NiwidXNlcl9pZCI6IjIifQ.IpouxBojrfrj8ApGE6akG4eCTTN2GezWLzGp6uWLnUo' --trace-ascii dumps.txt
