FROM sequenceiq/spark:1.3.0
MAINTAINER Michael Bechauf

EXPOSE 8080

COPY bootstrap.sh /etc/bootstrap.sh
COPY spark-shell.sh /spark-shell.sh
COPY log4j.properties /usr/local/spark/conf/

ENTRYPOINT ["/etc/bootstrap.sh"]


