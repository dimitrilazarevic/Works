# ========== Stage 1 : build ==========

FROM node:24.13-slim AS builder
WORKDIR /works
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

# =========== Stage 2 : Run ============

FROM node:24.13-slim AS runner
WORKDIR /works

# Créer l'utilisateur non-root
RUN groupadd -r app && useradd -r -g app app

COPY --from=builder /works/node_modules                /works/node_modules
COPY --from=builder /works/build                       /works/build

EXPOSE 3000

USER app
CMD ["node", "build"]