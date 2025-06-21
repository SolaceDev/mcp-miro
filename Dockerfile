FROM node:18
WORKDIR /app
COPY package*.json ./
RUN npm install && npm run build
RUN addgroup --system --gid 1001 nodejs
RUN adduser --system --uid 1001 nextjs
USER nextjs
