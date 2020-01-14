FROM alpine

RUN apk add --no-cache pgpool gettext postgresql-client
RUN mkdir /var/run/pgpool/

COPY ./conf /etc/pgpool
COPY entrypoint.sh .

EXPOSE 5432

ENTRYPOINT ["/bin/sh", "entrypoint.sh"]
CMD ["pgpool", "-n"]