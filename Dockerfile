# Stage 1: Build Stage
FROM node:18-alpine as build

WORKDIR /app

# Install dependencies
COPY package.json package-lock.json ./
RUN npm install

# Copy Prisma schema and generate Prisma client
COPY prisma ./prisma/
RUN npx prisma generate

# Copy the rest of the code and build the app
COPY . .
RUN npm run build

# Stage 2: Production Stage
FROM node:18-alpine

WORKDIR /app

# Copy the built files from the previous stage
COPY --from=build /app/.next ./.next
COPY --from=build /app/node_modules ./node_modules
COPY --from=build /app/package.json ./package.json

EXPOSE 3000

# Start the application
CMD ["npm", "start"]
