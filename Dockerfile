FROM node:10-alpine

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app
WORKDIR /home/node/app
COPY package*.json ./
COPY ./app/myJavaScriptApp.js ./
USER node
RUN npm install
COPY --chown=node:node . .
EXPOSE 8080

CMD [ "node", "myJavaScriptApp.js" ]