FROM node:22-alpine AS builder

LABEL stage="builder"

WORKDIR /app

COPY . .

RUN yarn install

RUN yarn build

FROM node:22 AS main

LABEL stage="main"

WORKDIR /app

COPY --from=builder /app/ .

EXPOSE 3000
EXPOSE 3001
EXPOSE 3002

ENTRYPOINT ["yarn", "start:ci"]