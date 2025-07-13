#FROM python:3.9

#WORKDIR /code

#COPY ./requirements.txt /code/requirements.txt

#RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

#COPY ./src /code/app

#CMD ["fastapi", "run", "app/main.py", "--port", "80"]

# Build Stage
FROM python:3.9-slim as builder

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

COPY ./requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Final Stage
FROM python:3.9-slim

WORKDIR /app

COPY --from=builder ./src /app

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]