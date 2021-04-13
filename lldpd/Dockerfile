FROM centos:latest

RUN dnf -y install lldpd tcpdump \
centos-release-openstack-train \
&& dnf install -y openvswitch libibverbs libvirt-client \
sudo
COPY exporters /exporters
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /exporters/* && chmod +x /docker-entrypoint.sh
ENTRYPOINT ["./docker-entrypoint.sh"]
