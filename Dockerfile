FROM caddy:alpine

# Install Node.js and npm
RUN apk update && apk add --no-cache nodejs npm

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json for npm install
COPY package*.json ./

# Install project dependencies
RUN pnpm install

# Copy the rest of the application code
COPY . .

# Build the application
RUN pnpm run build

# Copy the built files to the Caddy server directory
RUN cp -r dist/* /srv/

# Copy the Caddyfile
COPY ./Caddyfile /etc/caddy/Caddyfile