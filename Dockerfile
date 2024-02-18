FROM node:16.14 AS builder

WORKDIR /app

COPY . .

RUN yarn && yarn build

FROM nginx

COPY --from=builder /app/dist/my-angular-app /usr/share/nginx/html

COPY ./nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]