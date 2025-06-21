FROM node:18

WORKDIR /app

# Copy only package.json files first
COPY package*.json ./

# Disable lifecycle scripts for install step
RUN npm install --ignore-scripts

# Copy the rest of the application code
COPY . .

# Manually run prepare now that code is present
RUN npm run prepare

# Create a non-root user
RUN addgroup --system --gid 1001 nodejs && \
    adduser --system --uid 1001 nextjs

USER nextjs

CMD ["node", "build/index.js"]
