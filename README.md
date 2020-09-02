# Docker Swarm on Windows Server

![alt text](https://github.com/leandroscardua/Windows-Container/blob/master/swarm/Untitled%20Diagram-Page-1.png)

# Installing docker swarm on node 1
curl.exe -LO https://github.com/leandroscardua/Windows-Container/blob/master/swarm/docker-swarm.ps1
.\docker-swarm.ps1 -servername win19-n1 | Out-Null

# Installing docker swarm on node 2
curl.exe -LO https://github.com/leandroscardua/Windows-Container/blob/master/swarm/docker-swarm.ps1
.\docker-swarm.ps1 -servername win19-n2 | Out-Null
