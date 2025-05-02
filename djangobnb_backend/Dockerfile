FROM python:3.12.2-slim-bullseye

WORKDIR /usr/src/djangobnb_backend

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Install dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    netcat \
    dos2unix && \  # Added for Windows/WSL compatibility
    rm -rf /var/lib/apt/lists/*

# Python setup
RUN pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install -r requirements.txt

# Handle entrypoint with proper permissions
COPY ./entrypoint.sh .
RUN dos2unix entrypoint.sh && \  # Convert line endings
    chmod +x entrypoint.sh && \  # Make executable
    chown 1000:1000 entrypoint.sh

COPY . .

ENTRYPOINT ["/usr/src/djangobnb_backend/entrypoint.sh"]