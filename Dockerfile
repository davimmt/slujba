FROM node:22-alpine

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm ci

RUN apk add --no-cache neovim

COPY . .

EXPOSE 4321

CMD ["npm", "run", "dev"]
