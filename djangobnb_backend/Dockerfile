FROM python:3.12.2-slim-bullseye

WORKDIR /usr/src/djangobnb_backend

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Install system dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    netcat \
    dos2unix && \
    rm -rf /var/lib/apt/lists/*

# Python dependencies
RUN pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install -r requirements.txt

# Handle entrypoint with multiple safeguards
COPY ./entrypoint.sh /tmp/
RUN dos2unix /tmp/entrypoint.sh && \
    chmod +x /tmp/entrypoint.sh && \
    mv /tmp/entrypoint.sh /usr/src/djangobnb_backend/entrypoint.sh

# Copy application code
COPY . .

# Final permission check (redundant safety)
RUN chmod +x /usr/src/djangobnb_backend/entrypoint.sh

ENTRYPOINT ["/usr/src/djangobnb_backend/entrypoint.sh"]