FROM openjdk:8-jre-buster
MAINTAINER Lihan Li

# Get latest stable release of ZooKeeper
RUN wget -q -O - https://archive.apache.org/dist/zookeeper/zookeeper-3.6.2/apache-zookeeper-3.6.2-bin.tar.gz | tar -xzf - -C /opt \
    && mv /opt/apache-zookeeper-3.6.2-bin/ /opt/zookeeper \
    && cp /opt/zookeeper/conf/zoo_sample.cfg /opt/zookeeper/conf/zoo.cfg


EXPOSE 2181 2888 3888
WORKDIR /opt/zookeeper

VOLUME ["/opt/zookeeper/conf", "/tmp/zookeeper"]
ENTRYPOINT ["/opt/zookeeper/bin/zkServer.sh"]
CMD ["start-foreground"]
