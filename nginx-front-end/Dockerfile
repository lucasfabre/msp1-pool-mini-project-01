FROM node:latest as builder

WORKDIR /app

COPY ./app/package.json .

RUN apt-get update && apt-get upgrade -y                        && \
    apt-get install -y apt-utils git openssh-client python2.7

RUN npm install && npm audit fix                                && \
    npm install -g node-gyp 

COPY ./app .

RUN npm run build

FROM nginx:alpine
COPY --from=builder /app/dist /usr/share/nginx/html
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d
EXPOSE 80
CMD [ "nginx", "-g", "daemon off;" ]
