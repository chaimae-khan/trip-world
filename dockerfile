#we use an official Python runtime as a parent image
FROM python:3.10.12-slim

# we set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# we set the working directory
WORKDIR /app

# we install system dependencies
RUN apt-get update && apt-get install -y \
    postgresql-client \
    gcc

# we install Python dependencies
COPY requirements.txt /app/

RUN pip install --upgrade pip && pip install -r requirements.txt && pip install Pillow

# Copy the Django app code into the container
COPY . /app/
# Make manage.py executable
RUN chmod +x /app/manage.py

CMD ["bash", "-c", "\
    until pg_isready -h $DB_HOST -p $DB_PORT -U $DB_USER; do \
        echo 'Waiting for PostgreSQL to be ready...'; \
        sleep 2; \ 
    done && \
    python manage.py makemigrations && \
    python manage.py migrate && \
    python manage.py runserver 0.0.0.0:8000"]

