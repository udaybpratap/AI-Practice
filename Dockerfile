FROM python:3.9-slim

WORKDIR /app

COPY ./requirements.txt /app/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /app/requirements.txt

COPY ./src /app

CMD ["fastapi", "run", "main.py", "--port", "8000"]
#CMD ["uvicorn", "run", "main:app", "--port", "8000"]
#CMD ["uvicorn", "main:app", "--port", "8000", "--reload"]

# Build Stage
#FROM python:3.9-slim as builder
#FROM python:3.9-slim
#ENV PYTHONDONTWRITEBYTECODE=1
#ENV PYTHONUNBUFFERED=1

#WORKDIR /code

#COPY ./requirements.txt /code/requirements.txt
#RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

#RUN pip install --no-cache-dir -r /code/requirements.txt
#RUN pip install fastapi uvicorn

#COPY ./src /code/app

# Final Stage
#FROM python:3.9-slim

#WORKDIR /app

#COPY --from=builder ./app /app

#CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
#CMD ["fastapi", "run", "app/main.py", "--port", "80"]