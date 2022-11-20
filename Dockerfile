# starting build phase
FROM node:alpine as builder 
WORKDIR "/app"
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
# copying files from a phase
COPY --from=builder /app/build /usr/share/nginx/html
