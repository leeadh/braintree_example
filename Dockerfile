############################################################
# Dockerfile to build Python WSGI Application Containers
# Based on Ubuntu
############################################################

FROM ubuntu:latest
RUN apt-get update -y && apt-get install -y apt-transport-https
RUN apt-get install -y python-pip python-dev build-essential


COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt
ENTRYPOINT ["python"]
CMD ["app.py"]
