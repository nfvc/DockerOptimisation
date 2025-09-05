# Utilise une image Alpine plus légère
FROM node:20-alpine

# Installe les dépendances système nécessaires
RUN apk add --no-cache build-base ca-certificates

# Définit le répertoire de travail
WORKDIR /app

# Copie les fichiers de dépendances en premier pour optimiser le cache
COPY package*.json ./

# Installe les dépendances
RUN npm ci

# Copie le reste du code source
COPY --chown=nextjs:nodejs . .

# Définit les variables d'environnement
ENV NODE_ENV=development