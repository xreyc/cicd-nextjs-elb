FROM node:18.14.1-alpine3.17 AS builder
WORKDIR /app
COPY package.json .
RUN npm install --production
COPY . .
RUN npm run build

FROM node:18.14.1-alpine3.17 AS production
WORKDIR /app
COPY --from=builder /app .
EXPOSE 80
CMD ["npm", "start"]