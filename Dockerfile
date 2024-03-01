FROM node:hydrogen-slim
RUN mkdir /app
COPY . /app
WORKDIR /app
ENV token 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
RUN npm config set registry https://registry.npmjs.org/
RUN npm config set //registry.npmjs.org/:_authToken $token
RUN npm whoami