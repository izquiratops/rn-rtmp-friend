FROM node:lts

RUN curl -f https://get.pnpm.io/v6.16.js | node - add --global pnpm

RUN apt-get update && apt-get install -y jq