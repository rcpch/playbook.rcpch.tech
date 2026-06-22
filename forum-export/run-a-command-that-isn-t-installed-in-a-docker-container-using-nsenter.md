Today I learned that there is such a thing as a 'distroless' Docker image, this is essentially removing ALL non-essential OS binaries from a container so as to render it extremely hard for an attacker to move laterally if the app running in the container is compromised. If they found a vulnerability and exploited it to get a root shell, they would find there are *no standard Unix/Linux tools installed* to exploit with!

I found this out as part of a small internet odyssey that started off looking for [Bitnami](https://www.reddit.com/r/selfhosted/comments/1ma5d8t/migrating_away_from_bitnami/) alternatives but ended up on this GitHub README.md:

https://github.com/11notes/RTFM/blob/main/linux/container/image/distroless.md#user-content-fnref-1-e18e58ba68c35c5813bf9d268252b15f

In short, with a distroless container there is no `bash`, no `sh`, literally nothing except the essentials, which can make debugging harder because you can't do `docker exec -it bash`.

But at the very bottom of the page it shows a very neat trick for executing commands in the namespace of the container, which is actually even better because you can pass in **any** binary you have installed on the host machine, **without having to install it in the container**.

### Example
Here I try to execute `netstat -plan` inside a container in which `netstat` is not installed:
```bash
~/$ docker exec -it rcpchgrowth-dev bash
root@d4a21aff6b7b:/app# netstat -plan
bash: netstat: command not found               # it doesn't work
root@d4a21aff6b7b:/app# exit
```

Here I use the `nsenter` tool to execute the `netstat` binary that is installed on the host machine, inside the *namespace* of the container:
```bash
~/$ sudo nsenter -t $(docker inspect -f '{{.State.Pid}}' rcpchgrowth-dev) -n netstat -plan                                                           127 ↵
Active Internet connections (servers and established)
Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name    
tcp        0      0 127.0.0.11:42973        0.0.0.0:*               LISTEN      1990/dockerd        
udp        0      0 127.0.0.11:44477        0.0.0.0:*                           1990/dockerd        
Active UNIX domain sockets (servers and established)
Proto RefCnt Flags       Type       State         I-Node   PID/Program name     Path
```

I had never come across this tool or this usage, but I thought it might be useful to others in the team. It seems like fairly advanced Linuxing to me, and I don't know anything about the limitations of this technique, but it seems pretty cool.

`nsenter` was installed by default on my Linux Mint 22.1 (Ubuntu Noble) machine.

<div data-theme-toc="true"> </div>