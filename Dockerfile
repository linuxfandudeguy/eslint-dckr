# Use an official Node.js image as the base image
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /app

# Initialize a new package.json file and install ESLint and dependencies
COPY package.json ./
COPY pnpm-lock.yaml ./
COPY node_modules ./
RUN npm install

# Copy the ESLint configuration file
COPY eslint.config.mjs ./

# Define the default command to run ESLint
CMD ["npx", "eslint", "--config", "eslint.config.mjs", "."]
