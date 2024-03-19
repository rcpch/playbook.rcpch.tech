# Base Docker image Official Python 3.10 | Debian
FROM python:3.12

# Set 'build-time' environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Packages required for Material for MkDocs plugins (dependency for git and pdf plugins)
RUN apt-get update && \
    apt-get install -y git python3-cffi python3-brotli libpango-1.0-0 libpangoft2-1.0-0

# Copy all contents into dir
COPY . /app/

# Set working directory
WORKDIR /app/

# Install requirements
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

# Set safe working directory for git
RUN git config --global --add safe.directory /app




