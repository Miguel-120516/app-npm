# Use a specific, tagged Node.js image for reproducibility
FROM node:16-alpine

# Set the working directory within the container (optional)
WORKDIR /app

# Copy your application code into the container
COPY . .

# Install dependencies (assuming package.json is present)
RUN npm install

# Set the npm registry URL (store credentials outside the Dockerfile)
ENV NPM_CONFIG_REGISTRY https://registry.npmjs.org/

# Authenticate to the registry (avoid storing the token in the Dockerfile)
ARG NPM_AUTH_TOKEN

# Important: Do not directly embed the token in the Dockerfile!
# Instead, consider environment variables, secrets management tools, or passing the token securely during runtime.
RUN echo "//registry.npmjs.org/:_authToken=$NPM_AUTH_TOKEN" > .npmrc

# Alternatively, use a multi-stage build:
#   - Build stage: Set the NPM_AUTH_TOKEN argument and execute the authentication commands
#   - Final stage: Copy the .npmrc file from the build stage and execute publish

# Initialize your project (assuming package.json is present)
RUN npm init -y

# Publish your package (ensure security measures are in place)
RUN npm publish

# (Optional) Clean up the build cache
RUN npm cache clean --force
