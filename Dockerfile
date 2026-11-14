
FROM node:26-alpine

WORKDIR /app

COPY --chown=node:node package*.json ./

RUN chown -R node:node /app

USER node

RUN npm ci

# Copy application source
COPY --chown=node:node . .

# Run tests during image build
RUN npm test

EXPOSE 8000

CMD ["npm", "start"]
