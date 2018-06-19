FROM python:3.6.5-alpine3.7
MAINTAINER Rémy Greinhofer <remy.greinhofer@gmail.com>

# Install package.
RUN pip install --no-cache-dir flower==0.9.2 redis==2.10.6

# Copy entrypoint.
COPY docker-entrypoint.sh /

# Expose port.
EXPOSE 5555

ENTRYPOINT ["/docker-entrypoint.sh"]
