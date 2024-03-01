FROM python:3.9-slim-buster

RUN apt-get update && apt-get install -y \
    curl \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt ./tmp/
RUN pip install --no-cache-dir -r /tmp/requirements.txt

WORKDIR /app
COPY . .

CMD [ "python", "./prometheus_data_generator/main.py" ]
