FROM node:20.1.0-alpine3.17

WORKDIR /app

COPY package*.json ./

# Install dependencies just for production
RUN npm install --production

ENV NODE_ENV=production

COPY . .

EXPOSE 3000

CMD [ "node", "./src/index.js" ]