### node-build stage

FROM node:22-alpine

WORKDIR /app

RUN node -v

COPY package.json .
COPY Makefile .
COPY src /app/src

RUN apk add --no-cache make nginx
RUN npm install

COPY nginx.conf /etc/nginx/nginx.conf

# Expose the nginx server port
EXPOSE 8080

# Start the Node.js server and nginx together
CMD ["sh", "-c", "node --experimental-strip-types /app/src/server.ts & nginx -g 'daemon off;'"]
