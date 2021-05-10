FROM node:alpine
RUN mkdir /app -p && chown -R node:node /app
WORKDIR /app
COPY ./package*.json ./
RUN npm install
COPY ./ ./

# /app/build is the result
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html

# Default nginx command works for us
