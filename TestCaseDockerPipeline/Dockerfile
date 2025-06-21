FROM python:3.10-slim

WORKDIR /app

COPY . .

RUN pip install --no-cache-dir -r requirementa.txt

CMD [ "./test.sh" ]