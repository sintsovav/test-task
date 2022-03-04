FROM python:3.8-alpine

WORKDIR /app
COPY requirements.txt app.py s3_functions.py ./
RUN pip install -r requirements.txt
EXPOSE 5000/tcp

CMD [ "python", "./app.py" ]