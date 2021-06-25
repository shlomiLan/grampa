# Container image that runs your code
FROM python:3.9.5-alpine

#ENV GITHUB_WORKSPACE=/
# Copies your code file from your action repository to the filesystem path `/` of the container
#RUN echo $GITHUB_WORKSPACE/main.py
COPY main.py /main.py
#
#CMD ["main.py"]
#ENTRYPOINT ["python"]


COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
