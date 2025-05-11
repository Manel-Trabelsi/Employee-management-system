FROM python:3.9-slim

# Prevents Python from writing pyc files to disk and buffering stdout/stderr
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Install OS dependencies
RUN apt-get update && apt-get install -y gcc default-libmysqlclient-dev netcat-openbsd

# Set working directory
WORKDIR /app

# Install Python dependencies
COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Copy the project files into the container
COPY . .

# Set permissions for entrypoint.sh
RUN chmod +x /app/entrypoint.sh

# Environment variables
ENV FLASK_APP=run.py
ENV FLASK_ENV=development
ENV FLASK_CONFIG=development

# Expose the Flask port
EXPOSE 5000

# Run the entrypoint script
CMD ["/app/entrypoint.sh"]
