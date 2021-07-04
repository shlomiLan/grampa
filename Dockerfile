# Container image that runs your code
FROM python:3.9.5-alpine

RUN apk --no-cache add git

COPY . .
RUN pip install -r requirements.txt --user

ENTRYPOINT ["/entrypoint.sh"]
