# Use official Python image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Install system dependencies (optional but useful for some Python libs)
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copy project files
COPY . /app

# Install Python dependencies
RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

# Set working dir to core (where script lives)
WORKDIR /app/core

# Default command (can be overridden)
ENTRYPOINT ["python", "inspector.py"]

# Example usage:
# docker run inspector +33666666666
