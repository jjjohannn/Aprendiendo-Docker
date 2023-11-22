FROM node:20.5.0-alpine3.18
# add react user and group 
RUN addgroup react && adduser -S -G react react
# change ownership of /app to react user
USER react
#directory to work in container
WORKDIR /app/
#make directory for data
RUN mkdir datos
#copy package.json and package-lock.json to container
COPY --chown=react package*.json .
#install node modules
RUN npm install
#copy all files from current directory to container
COPY --chown=react . .
#expose port 5173
EXPOSE 5173
#run the app
CMD ["npm", "run", "dev"]