FROM node:13

# set working directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# add `/usr/src/app/node_modules/.bin` to $PATH
ENV PATH /usr/src/app/node_modules/.bin:$PATH
# install and cache app dependencies
COPY package*.json ./
COPY tsconfig.json ./

# add app
COPY . /usr/src/app

RUN npm install
RUN npm run tsc

# prod port
EXPOSE 8082

# start app
CMD [ "source", "set_env.sh"]
CMD [ "npm", "start" ]