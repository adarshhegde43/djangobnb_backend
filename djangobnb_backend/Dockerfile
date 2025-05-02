FROM python:3.12.2-slim-bullseye

WORKDIR /usr/src/djangobnb_backend

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1 

RUN apt-get update && apt-get install -y netcat

RUN pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install -r requirements.txt

# 1. First copy ONLY entrypoint.sh and fix permissions
COPY ./entrypoint.sh .
RUN sed -i 's/\r$//' /usr/src/djangobnb_backend/entrypoint.sh && \
    chmod +x /usr/src/djangobnb_backend/entrypoint.sh

# 2. Then copy the rest of the files
COPY . .

ENTRYPOINT [ "/usr/src/djangobnb_backend/entrypoint.sh" ]