# Base Image with NODE JS
FROM node:12.2.0-alpine

# Working dir with all code files
WORKDIR /app

# Copy code from src to dsn
COPY . .

# Install packages
RUN npm install

# Run container with arguments
CMD ["node","app.js"]
