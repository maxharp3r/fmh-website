+++
date = "2016-10-04T11:13:23-05:00"
title = "Setting Up a Proxy to mLab"
+++

I am using [mLab](https://mlab.com/) in our curriculum for Developing the Interactive Web.  MLab is a neat service that provides MongoDB as a service. Unfortunately, our firewall at the University of Minnesota aggressively filters outbound TCP traffic, which makes it more complicated to establish a connection with databases at mLab. Typically, I would solve this using an SSH tunnel, but mLab does not support SSH connections.  Another solution might be to use a commercial VPN, but this could get expensive.

My kludgy solution is to use Amazon EC2 to host an nginx server, using their new [TCP pass-through feature](https://www.nginx.com/resources/admin-guide/tcp-load-balancing/) to route open outbound ports (e.g., 80) to mLab. I started up an EC2 instance in US-East (where mLab is also hosted), and mostly followed this wonderful tutorial at [Servers for Hackers](https://serversforhackers.com/tcp-load-balancing-with-nginx-ssl-pass-thru).

Here's an example `nginx.conf` to use in EC2:

```
user www-data;
worker_processes auto;
pid /run/nginx.pid;

events {
    #...
}

http {
    # ...
}

stream {
    upstream mongo_80 {
        server ds000000.mongolab.com:33333;
    }

    server {
        listen 80;
        proxy_pass mongo_80;
    }
}
```

Then, I can connect to mongo via a command like this:

```bash
mongo ec2-xxx-xxx-xxx-xxx.compute-1.amazonaws.com:80/db-name -u user -p pass
```

To find open TCP outbound ports, I used [portquiz.net](http://portquiz.net/). Here's a little bash script that requires one second per port:

```bash
for i in `seq 1 100`; do nc -w 1 -G 1 -v portquiz.net $i; done
```
