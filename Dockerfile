
# base image
FROM node:lts-alpine

# set working directory
WORKDIR /app
# add `/app/node_modules/.bin` to $PATH

# install and cache app dependencies
COPY package.json ./package.json
RUN npm install
COPY . .
RUN npm run build

EXPOSE 3000

ENV NUXT_HOST=0.0.0.0
ENV NUXT_PORT=3000

CMD ["npm", "start"]

