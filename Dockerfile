# Base Docker image Official Python 3.10 (slim version as fewer reqs) | Debian
FROM python:3.10:slim

# Extra packages required for Material for MkDocs plugins (dependency for git and pdf plugins)
RUN apt install -y git python3-cffi python3-brotli libpango-1.0-0 libpangoft2-1.0-0

# Install requirements
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Set safe working directory for git
RUN git config --global --add safe.directory /app

# Set working directory
WORKDIR /app/

# Copy all contents into dir
COPY . /app/
