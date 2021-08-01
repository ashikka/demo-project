# pull official base image
FROM node:lts-alpine

# set working directory
WORKDIR /

# set environment variables 
ENV PORT 3000

# install app dependencies
RUN npm install -g npm@7
COPY package.json ./
COPY package-lock.json ./
RUN npm install
COPY . ./
RUN npm run build

# start app
CMD ["npm", "start"]