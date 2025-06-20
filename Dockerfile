FROM python:3.9-slim

# Empêcher la création de .pyc et désactiver le buffering
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Installer les dépendances système
RUN apt-get update && apt-get install -y gcc default-libmysqlclient-dev netcat-openbsd

# Définir le répertoire de travail
WORKDIR /app

# Copier les dépendances Python
COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Copier tous les fichiers du projet
COPY . /app

# Copier le entrypoint.sh (explicitement)
COPY entrypoint.sh /app/entrypoint.sh

# Donner les droits d'exécution (important sur Windows)
RUN chmod +x /app/entrypoint.sh

# Définir les variables d’environnement Flask
ENV FLASK_APP=run.py
ENV FLASK_ENV=development
ENV FLASK_CONFIG=development

# Exposer le port Flask
EXPOSE 5000

# Lancer l'application via le script
CMD ["/app/entrypoint.sh"]

