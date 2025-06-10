FROM node:16-alpine as builder
WORKDIR /app
COPY package.json ./
RUN npm install
COPY . .
RUN npm run build


# Nginx will have start up command automatically
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
