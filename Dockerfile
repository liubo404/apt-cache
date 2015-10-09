FROM debian

VOLUME ["/var/cache/apt-cacher-ng"]

###1.update the system
RUN rm -rf /etc/apt/sources.list
ADD ./sources.list /etc/apt/sources.list

RUN apt-get update -y 
RUN apt-get install -yq apt-cacher-ng

EXPOSE 3142
ADD ./init.sh /init.sh

CMD ["/bin/bash", "/init.sh"]