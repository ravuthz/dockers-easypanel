# Build stage

FROM oven/bun:1 AS builder

WORKDIR /app

COPY package*.json ./

RUN bun install

COPY . .

RUN bun run build

# Deploy stage

FROM nginx:1.28-alpine3.21

COPY --from=builder /app/dist /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]