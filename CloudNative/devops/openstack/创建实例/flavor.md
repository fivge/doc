Create a subnet on the network:

```
$ openstack subnet create --network provider \
  --allocation-pool start=START_IP_ADDRESS,end=END_IP_ADDRESS \
  --dns-nameserver DNS_RESOLVER --gateway PROVIDER_NETWORK_GATEWAY \
  --subnet-range PROVIDER_NETWORK_CIDR provider

```

Replace `PROVIDER_NETWORK_CIDR` with the subnet on the provider physical network in CIDR notation.

Replace `START_IP_ADDRESS` and `END_IP_ADDRESS` with the first and last IP address of the range within the subnet that you want to allocate for instances. This range must not include any existing active IP addresses.

Replace `DNS_RESOLVER` with the IP address of a DNS resolver. In most cases, you can use one from the `/etc/resolv.conf`file on the host.

Replace `PROVIDER_NETWORK_GATEWAY` with the gateway IP address on the provider network, typically the ”.1” IP address.

**Example**

The provider network uses 203.0.113.0/24 with a gateway on 203.0.113.1. A DHCP server assigns each instance an IP address from 203.0.113.101 to 203.0.113.250. All instances use 8.8.4.4 as a DNS resolver.



```shell
openstack subnet create --network provider --allocation-pool start=10.0.1.101,end=10.0.1.250 --dns-nameserver 8.8.4.4 --gateway 10.0.1.1 --subnet-range 10.0.1.0/24 provider
```



```
openstack subnet create --network selfservice \
  --dns-nameserver DNS_RESOLVER --gateway SELFSERVICE_NETWORK_GATEWAY \
  --subnet-range SELFSERVICE_NETWORK_CIDR selfservice
```

```shell
openstack subnet create --network selfservice \
  --dns-nameserver 8.8.4.4 --gateway 172.16.1.1 \
  --subnet-range 172.16.1.0/24 selfservice
```



```shell
openstack subnet create --network selfservice --dns-nameserver 8.8.4.4 --gateway 10.0.2.1 --subnet-range 10.0.2.0/24 selfservice
```

