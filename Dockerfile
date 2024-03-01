FROM node:hydrogen-slim
RUN mkdir /app
COPY . /app
WORKDIR /app
RUN npm config set registry https://registry.npmjs.org/
RUN npm config set //registry.npmjs.org/:_authToken ${token}