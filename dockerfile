# Utilise une image Alpine plus légère en version 22 qui est la dernière LTS
FROM node:22-alpine

# Définit le répertoire de travail
WORKDIR /app

# Copie les fichiers de dépendances en premier pour optimiser le cache Docker
COPY package*.json ./

# Installe uniquement les dépendances de production
RUN npm ci --only=production

# Copie le reste du code source
COPY . /app

# Définit les variables d'environnement
ENV NODE_ENV=development

# Expose le port 3000 car l'application n'utilise que ce port
EXPOSE 3000

# User node car les images créent un utilisateur propre
USER node

# Commande pour démarrer l'application
CMD ["node", "start"]
