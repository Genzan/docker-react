# User a Docker image as a base
FROM node:alpine

WORKDIR '/app'
# Download and Install dependencies
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Starting of Production Fase
FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html