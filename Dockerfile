# Stage 1: Build stage 
FROM node:14-alpine as build

# Setting the working directory
WORKDIR app

# Copy packages
COPY . .

#Install dependencies
RUN npm install

#Build the application
RUN npm run build 

#Stage 2: Production Stage
FROM nginx:alpine

#Setting the working directory
WORKDIR /usr/share/nginx/html

#Copy the build artifacts 
COPY --from=build /app/build .

#Expose port 80
EXPOSE 80

# No need to install NGINX again; it's already included in the base image

# Command to start NGINX
CMD ["nginx", "-g", "daemon off;"]

