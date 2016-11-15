FROM node:latest

WORKDIR /navigation

COPY package.json /navigation
RUN npm install
COPY . /navigation

EXPOSE 8360

CMD ["node", "www/development.js"]