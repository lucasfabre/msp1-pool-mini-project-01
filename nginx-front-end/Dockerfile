FROM node:10
 
ADD app /app
WORKDIR /app
 
RUN npm install
RUN npm install apexcharts --save
RUN npm install vue-apexcharts --save
RUN npm run build

ENTRYPOINT ["ls", "-l"]