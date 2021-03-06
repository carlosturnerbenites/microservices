FROM node:carbon

# Create app directory
WORKDIR /var/www/

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY web/package*.json /var/www/
COPY web/sap/package*.json /var/www/sap/

RUN npm install

RUN npm --prefix sap/ install

# If you are building your code for production
# RUN npm install --only=production

# Bundle app source
COPY web/ /var/www/

RUN npm --prefix sap/ run build

EXPOSE 80

CMD [ "npm", "start" ]
