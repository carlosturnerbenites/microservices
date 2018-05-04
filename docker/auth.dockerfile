FROM node:carbon

# Create app directory
WORKDIR /var/www/

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY services/auth/package*.json /var/www/

RUN npm install
# If you are building your code for production
# RUN npm install --only=production

# Bundle app source
COPY services/auth/ /var/www/

EXPOSE 80

CMD [ "npm", "start" ]
