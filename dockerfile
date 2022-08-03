FROM node:14

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY ./src .

# Build env var only (not in final image)
ARG FLAG

# Reference it in docker env (persist)
ENV FLAG=$FLAG

# Set permission for script
# Exec script to create secrete folders and file
# Remove script after exec
RUN chmod 777 ./prepare.sh && ./prepare.sh && rm ./prepare.sh

# Set fake FLAG env var
ENV FLAG=nope

# Set env var for telling where is the file containing the FLAG located
ENV FLAG_PATH=/tmp/.file64.32738

EXPOSE 8080
CMD [ "node", "index.js" ]