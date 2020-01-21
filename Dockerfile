FROM debian:stable-slim

RUN apt-get update && apt-get -y install pgpool2 gettext
RUN mkdir /var/run/pgpool/

COPY ./conf /etc/pgpool2
COPY entrypoint.sh .

EXPOSE 5432

ENTRYPOINT ["/bin/sh", "entrypoint.sh"]
CMD ["pgpool", "-n"]