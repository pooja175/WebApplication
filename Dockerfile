FROM python:3.11-slim

WORKDIR /app

#Install sys dependency
RUN apt-get update && apt-get install -y --no-install-recommends build-essensial \
    && rm -ef /var/lib/apt/listed/*


COPY requirements.txt /app/requirements.txt
RUN pip install -r /app/requirements.txt

COPY . /app

#use gunicorn for production
ENV PORT=8080

CMD["gunicorn", "--bind", "127.0.0.1:8080", "app:main", "--workers", "2" ]
