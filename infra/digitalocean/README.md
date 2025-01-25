See [../ansible](../ansible) for automated configuration scripts.

From control machine (laptop) to deploy to host (digital ocean)

```sh
ansible-playbook -i inventory.ini deploy.yaml -u root
```

Some commands need to run on the host.

First ssh in (configure ssh key on digital ocean: https://cloud.digitalocean.com/networking/domains/parq-proto.com?i=49bceb).

```sh
ssh root@<ipaddr>

# in host
cd /app

# restart services
docker compose restart
```



