# TP 1 Docker 

## Objectif
Se familiariser avec Docker : installation, images, conteneurs, exécution d’un serveur Nginx, déploiement d’une appli Flask, et orchestration avec `docker compose` (Flask + MongoDB).

## Prérequis
- Docker Desktop (Windows) avec `docker compose` v2
- Git
- Éditeur de code


# Vérification
docker --version
docker compose version

# Images et conteneurs
docker images
docker ps
docker ps -a

# Hello world
docker pull hello-world
docker run hello-world

# Nginx
- docker pull nginx
- docker run -d -p 8080:80 --name mon_nginx nginx
- docker stop mon_nginx && docker rm mon_nginx

# Flask (build & run)
- cd "TP Docker/Exo3-Flask"
- docker build -t flask-demo .
- docker run -d -p 5000:5000 --name flask-demo flask-demo

# Compose Flask + MongoDB
- cd "TP Docker/Exo4-Compose-Flask-Mongo"
- docker compose up -d --build
- docker compose ps
- docker compose down
