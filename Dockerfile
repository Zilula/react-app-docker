#multi step docker build 

FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . . 

RUN npm run build



# FROM statements end a cycle and start another without issue
FROM nginx

#exposes a port to allow AWS to know what port to use
EXPOSE 80

# copy the build file from the previous step into some directory
COPY --from=builder /app/build /usr/share/nginx/html


# default command of nginx is to start 

