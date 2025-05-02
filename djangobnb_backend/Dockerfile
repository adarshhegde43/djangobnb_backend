FROM python:3.12.2-slim-bullseye

WORKDIR /usr/src/djangobnb_backend

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Install only essential dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    netcat && \
    bash && \
    rm -rf /var/lib/apt/lists/*

# Python setup
RUN pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install -r requirements.txt

COPY --chmod=755 --chown=1000:1000 ./entrypoint.sh . 
COPY . .

ENTRYPOINT ["/usr/src/djangobnb_backend/entrypoint.sh"]