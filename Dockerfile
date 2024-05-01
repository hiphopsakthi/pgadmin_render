# Use Ubuntu as base image
FROM ubuntu:latest

# Install necessary packages
RUN apt-get update && \
    apt-get install -y curl && \
    apt-get install -y gnupg && \
    apt-get install -y apt-transport-https && \
    apt-get install -y lsb-release && \
    apt-get clean

# Add pgAdmin repository key
RUN curl https://www.pgadmin.org/static/packages_pgadmin_org.pub | apt-key add -

# Add pgAdmin repository to sources list
RUN sh -c 'echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/snapshots/2022-05-05/apt/jammy pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list'

# Update apt package index
RUN apt-get update

# Install pgAdmin 4 web package
RUN apt-get install -y pgadmin4-web

# Expose port if necessary
# EXPOSE 5050

# Command to run the pgAdmin web interface
# CMD ["pgadmin4"]
RUN sudo /usr/pgadmin4/bin/setup-web.sh
