FROM mcr.microsoft.com/playwright:v1.60.0-noble

WORKDIR /app

COPY package.json yarn.lock ./

RUN yarn install

COPY . .

CMD ["yarn", "playwright", "test"]