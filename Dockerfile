# Container image that runs your code
FROM python:3.9.5-alpine

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY main.py /main.py

CMD ["main.py"]
ENTRYPOINT ["python"]
