# Stage 1: Build
FROM --platform=linux/amd64 AS build

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Build the application
RUN npm run build

# Stage 2: Production
FROM  --platform=linux/amd64 AS production

# Install 'serve' globally to serve the build output
RUN npm install -g serve

# Set the working directory
WORKDIR /app

# Copy the build folder from the build stage
COPY --from=build /app/build ./build

# Expose port 3000
EXPOSE 3000

# Start the application using 'serve'
CMD ["serve", "-s", "build"]
