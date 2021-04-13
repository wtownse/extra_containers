#!/bin/bash

case $1 in
     "lldpd") lldpd -dd -l
     ;;
     "one-exporter") /exporters/opennebula-exporter --web.listen-address=:$PORT
     ;;
     "ovs-exporter") /exporters/ovs_info --web.listen-address=:$PORT
     ;;
     "libvirt-exporter") /exporters/libvirt_exporter --web.listen-address=:$PORT
     ;;
     *) echo "$0 [lldpd|one-exporter|ovs-exporter|libvirt-exporter]"
esac
