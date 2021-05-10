FROM node:alpine
WORKDIR '/frontend'
COPY package.json ./
RUN npm install
COPY ./ ./
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=0 /frontend/build /usr/share/nginx/html

# Default nginx command starts the server
