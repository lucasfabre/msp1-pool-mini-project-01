FROM nginx:stable-alpine as production-stage

COPY --from=build-stage /app/dist /usr/share/nginx/html

WORKDIR /app

COPY package*.json ./

RUN npm install		&& \
    npm install --save moment

COPY app .

RUN npm run build

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
