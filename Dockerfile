FROM node:hydrogen-slim
RUN mkdir /app
COPY . /app
WORKDIR /app
RUN yarn install && yarn build