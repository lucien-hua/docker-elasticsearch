# VERSION    1.0
FROM jeanblanchard/busybox-java

MAINTAINER Vadim Bauer <hello@z-rechnung.de>

ENV el=elasticsearch-1.4.4

RUN curl -kLsS http://download.elasticsearch.org/elasticsearch/elasticsearch/${el}.tar.gz | gunzip -c | tar -xf - -C /opt &&\
    ln -s /opt/${el} /opt/elasticsearch
    
COPY config/* /opt/elasticsearch/config/

EXPOSE 9200

ENTRYPOINT ["/opt/elasticsearch/bin/elasticsearch"]
