# Utilisez une image de base légère
FROM alpine:3.18

# Installez Docker CLI et Docker Compose
RUN apk add --no-cache docker-cli docker-compose

# Créez les répertoires où les données seront stockées
RUN mkdir -p /app/data/mysql /app/mongo/db

# Copiez le docker-compose.yml dans l'image
COPY docker-compose.yml /app/docker-compose.yml

# Copiez les répertoires de données dans l'image
COPY ./data/mysql /app/data/mysql
COPY ./mongo/db /app/mongo/db

# Définissez le répertoire de travail
WORKDIR /app

# Commande par défaut pour lancer les conteneurs
CMD ["docker-compose", "up"]
