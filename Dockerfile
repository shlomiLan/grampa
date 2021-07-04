# Container image that runs your code
FROM python:3.9.5-alpine

RUN apk --no-cache add git

COPY . .

RUN python3 -m venv venv
RUN source ./venv/bin/activate
RUN pip install -r requirements.txt

ENTRYPOINT ["/entrypoint.sh"]
