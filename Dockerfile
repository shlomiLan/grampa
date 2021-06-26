# Container image that runs your code
FROM python:3.9.5-alpine

RUN apk update
RUN apk add git

COPY . .
RUN pip install -r requirements.txt


ENTRYPOINT ["/entrypoint.sh"]
