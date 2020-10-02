# User a Docker image as a base
FROM node:alpine as builder

WORKDIR '/app'
# Download and Install dependencies
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Starting of Production Fase
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html


