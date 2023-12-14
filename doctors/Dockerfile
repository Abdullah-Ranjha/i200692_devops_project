
FROM python:3.8-slim
WORKDIR /app
COPY . /app

RUN pip install flask

EXPOSE 9090

ENV NAME AppointmentsMicroservice

CMD ["python", "app.py"]
