FROM node:20-alpine

WORKDIR /usr/src/app

COPY package.json ./
RUN npm install --omit=dev

COPY server.js ./

ENV PORT=8080
ENV APP_NAME=aws-app-platform
ENV APP_VERSION=dev

EXPOSE 8080

CMD ["npm", "start"]
