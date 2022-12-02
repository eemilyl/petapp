FROM node

RUN apk ad --no-cache git

RUN go get github.com/laurelehigbee/proj3

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

WORKDIR /home/node/app

COPY package*.json ./

USER node

RUN npx npm@6 install

COPY --chown=node:node . .

EXPOSE 3000

CMD [ "node", "index.js" ]
