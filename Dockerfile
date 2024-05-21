FROM node:latest
# RUN apk add --no-cache nodejs npm

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . . 
RUN npm run build

COPY . /app
EXPOSE 3000 
#ENV CONNECTION_STRING=mongodb://host.docker.internal:27017/yourdatabase
ENV CONNECTION_STRING=mongodb://3.26.166.63:27017/admin

CMD ["node", "dist/index.tsx"]