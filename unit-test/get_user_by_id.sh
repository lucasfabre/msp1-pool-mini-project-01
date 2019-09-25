curl -X GET \
  http://ec2-13-59-172-229.us-east-2.compute.amazonaws.com:4000/api/users/$(ID_USER) \
  -H 'Content-Type: application/json' \
  -H 'Postman-Token: 30db51d8-5838-42ad-abe7-699643926744' \
  -H 'cache-control: no-cache' \
  -H 'session_jwt: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJKb2tlbiIsImV4cCI6MTU2OTQxNDE0NiwiaWF0IjoxNTY5NDA2OTQ2LCJpc3MiOiJKb2tlbiIsImp0aSI6IjJuM3FlamI3bHNqaTc1ZzFlYzAwMDEyaCIsIm5iZiI6MTU2OTQwNjk0NiwidXNlcl9pZCI6IjIifQ.IpouxBojrfrj8ApGE6akG4eCTTN2GezWLzGp6uWLnUo' --trace-ascii dumps.txt
