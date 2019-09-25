curl -X GET \
  http://ec2-13-59-172-229.us-east-2.compute.amazonaws.com:4000/api/clocks/$(ID_USER) \
  -H 'Postman-Token: 4a9c5f27-6261-43df-af9c-7257347217f5' \
  -H 'cache-control: no-cache' --trace-ascii dumps.txt
