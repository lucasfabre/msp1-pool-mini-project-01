FROM node:10

WORKDIR /app

COPY . .

RUN npm install                             && \
    npm install moment --save               && \
    npm install vue-cookies --save          && \
    npm run build

COPY  --from=ui-builder /usr/src/app/dist /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]