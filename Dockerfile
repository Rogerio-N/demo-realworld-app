FROM node:22-alpine

WORKDIR /app

COPY package.json .
COPY yarn.lock .
COPY tsconfig.json .
COPY .env .
COPY vite.config.ts .
COPY tsconfig.tsnode.json .

COPY backend/ backend/
COPY data/ data/
COPY public/ public/
COPY scripts/ scripts/
COPY src/ src/
COPY build/ build/

RUN yarn install

EXPOSE 3000
EXPOSE 3001
EXPOSE 3002

ENTRYPOINT ["yarn", "start:ci"]