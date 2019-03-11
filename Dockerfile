# use MSSQL image; want ot consider version specific image
FROM microsoft/mssql-server-linux:latest

RUN apt-get update && apt-get install -y curl
RUN mkdir -p /var/opt/mssql/backup

# create a working directory for all database files
COPY ./db /var/opt/mssql/backup

WORKDIR /setup
COPY ./setup .

RUN chmod +x entrypoint.sh
RUN chmod +x import-data.sh

CMD /bin/bash ./entrypoint.sh

