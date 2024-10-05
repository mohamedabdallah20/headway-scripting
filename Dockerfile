FROM node:20.1.0-alpine3.17

WORKDIR /app

COPY package*.json ./

RUN npm install --production

ENV NODE_ENV=production

COPY . .

EXPOSE 3000

CMD [ "node", "index.js" ]