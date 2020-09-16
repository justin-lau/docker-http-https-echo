FROM node:14.9-alpine

WORKDIR /app

COPY . .

ENV HTTP_PORT=80 HTTPS_PORT=443

RUN npm install --production

RUN apk --no-cache add openssl && sh generate-cert.sh && rm -rf /var/cache/apk/*

ENTRYPOINT ["node", "./index.js"]
CMD []
