# FROM tiangolo/uwsgi-nginx-flask:python3.6
FROM python:3.6

RUN apt-get update -y
RUN apt-get install -y python-pip python-dev build-essential

COPY services/python/requirements.txt /var/www/

WORKDIR /var/www/

RUN pip install -r requirements.txt

COPY services/python/ /var/www/

ENTRYPOINT ["python"]
CMD ["app.py"]
