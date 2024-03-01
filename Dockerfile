FROM node:hydrogen-slim
RUN mkdir /app
COPY . /app
WORKDIR /app
RUN npm login