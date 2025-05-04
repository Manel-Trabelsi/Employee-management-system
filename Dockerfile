FROM python:3.9-slim

# Prevents Python from writing pyc files to disk and buffering stdout/stderr
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Install OS dependencies
RUN apt-get update && apt-get install -y gcc default-libmysqlclient-dev

# Set working directory
WORKDIR /app

# Install Python dependencies
COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
RUN apt-get update && apt-get install -y gcc default-libmysqlclient-dev netcat-openbsd


# Copy project
COPY . .

# Environment variables
ENV FLASK_APP=run.py
ENV FLASK_ENV=development
ENV FLASK_CONFIG=development

EXPOSE 5000

CMD ["./entrypoint.sh"]
