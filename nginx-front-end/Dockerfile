FROM node:10
 
ADD app /app
WORKDIR /app
 
RUN npm install
RUN npm run build

ENTRYPOINT ["ls", "-l"]