FROM python:3.12.2-slim-bullseye

WORKDIR /usr/src/djangobnb_backend

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Install dependencies - properly formatted RUN command
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    netcat \
    dos2unix && \
    rm -rf /var/lib/apt/lists/*  # This rm is part of the RUN command

# Python setup
RUN pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install -r requirements.txt

# Handle entrypoint with nuclear permission approach
COPY ./entrypoint.sh .
RUN dos2unix entrypoint.sh && \
    chmod a+rx entrypoint.sh && \
    sync && \
    ls -la entrypoint.sh  # Verify permissions

COPY . .

# Use absolute path with bash
ENTRYPOINT ["/bin/bash", "/usr/src/djangobnb_backend/entrypoint.sh"]