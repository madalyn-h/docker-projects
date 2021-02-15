#production

#build phase
FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
 
#run phase, FROM specifies new phase/block. Each FROM terminates the successive block
FROM nginx
#Elastic beanstalk will search for the EXPOSE command and use that for port mapping
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html