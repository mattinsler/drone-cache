FROM alpine

COPY cache.sh rebuild.sh restore.sh /

CMD [ "/cache.sh" ]
