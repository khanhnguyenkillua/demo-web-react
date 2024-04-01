## Build stage ##

FROM  node:18.18-alpine as build

WORKDIR /app
COPY . .
RUN npm cache clean --force
RUN npm install
RUN npm run build

## Start Stage ##

FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf"
EXPOSE 80
CMD ["nginx", "-g", "daemon off;" ]
