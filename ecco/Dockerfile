# vim:set ft=dockerfile:
FROM maven:3-openjdk-18-slim

# add our user and group first to make sure their IDs get assigned consistently, regardless of whatever dependencies get added
## RUN groupadd -r mysql && useradd -r -g mysql mysql

# as an exemple of app installation \
RUN set -ex; \
	apt-get update; \
    apt-get install -y --no-install-recommends git; \
	if ! which nano; then \
		apt-get install -y --no-install-recommends nano; \
	fi; \
	rm -rf /var/lib/apt/lists/*

RUN set -ex;\
    cd /; \
    git clone https://github.com/arademaker/ecco

# small patch to terminate smoothly after the build
COPY *.sh /ecco/

WORKDIR /ecco

# small patch to avoid a runtime exception...
RUN sed -i '/outputHandler.copySupportingDocuments/ s|^|/* | '  src/main/java/uk/ac/manchester/cs/diff/Ecco.java
RUN sed -i '/outputHandler.copySupportingDocuments/ s|$| */| '  src/main/java/uk/ac/manchester/cs/diff/Ecco.java

RUN set -ex;\
    ./ecco.sh

VOLUME /ecco-input
VOLUME /ecco/ecco-output

RUN pwd
RUN ls

ENTRYPOINT ["/ecco/ecco.sh"]