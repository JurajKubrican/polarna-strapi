FROM node:iron-bullseye

WORKDIR /app

RUN npm i -g npm@latest

COPY config config
COPY package.json package.json
COPY package-lock.json package-lock.json
COPY database database
COPY public public
COPY src src
COPY types types
COPY favicon.png favicon.png
COPY tsconfig.json tsconfig.json

RUN npm install

ENV NODE_OPTIONS="--max-old-space-size=4096"
RUN npm run build

CMD ["npm", "start"]

# Expose the port on which the Go server will run
EXPOSE 1337