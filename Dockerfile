FROM dpage/pgadmin4:latest
USER root
RUN setcap -r /usr/bin/python3.11
USER pgadmin
