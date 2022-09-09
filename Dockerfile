#using Node v12
From node:12

#Create app directory
WORKDIR /usr/src/lafs

#install app dependencies
#a wildcard is used to endure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./
RUN npm install -g @angular/cli@v6-lts
RUN npm install
# if you are building your code for production 
# RUN npm ci --only=production

#Bundle app source 
COPY . .

#Expose port 4200 outside container
EXPOSE 4200
#Command used to start application
CMD ng serve --host 0.0.0.0