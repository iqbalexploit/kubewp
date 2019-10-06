#Environment
OS : Ubuntu 18.04.2 LTS 
Kernel : Linux 4.15.0-51-generic #55-Ubuntu SMP Wed May 15 14:27:21 UTC 2019 x86_64 x86_64 x86_64 GNU/Linux
Minikube version: v1.1.1
Kubectl version
 Client Version: version.Info{Major:"1", Minor:"14", GitVersion:"v1.14.3", GitCommit:"5e53fd6bc17c0dec8434817e69b04a25d8ae0ff0", GitTreeState:"clean", BuildDate:"2019-06-06T01:44:30Z", GoVersion:"go1.12.5", Compiler:"gc", Platform:"linux/amd64"}
 Server Version: version.Info{Major:"1", Minor:"14", GitVersion:"v1.14.3", GitCommit:"5e53fd6bc17c0dec8434817e69b04a25d8ae0ff0", GitTreeState:"clean", BuildDate:"2019-06-06T01:36:19Z", GoVersion:"go1.12.5", Compiler:"gc", Platform:"linux/amd64"}
Docker Version
Client:
 Version:           18.09.5
 API version:       1.39
 Go version:        go1.10.4
 Git commit:        e8ff056
 Built:             Thu May  9 23:11:19 2019
 OS/Arch:           linux/amd64

Server:
 Engine:
  Version:          18.09.5
  API version:      1.39 (minimum version 1.12)
  Go version:       go1.10.4
  Git commit:       e8ff056
  Built:            Thu May  9 22:59:19 2019
  OS/Arch:          linux/amd64

# Docker Container Image :
 I'm using default docker container image :
  - mysql container : mysql:5.6
  - wordpress container : wordpress:latest 

# Provisioning script
   file : provision-deployment.sh
   Running provision script  :
   $ ./provision-deployment.sh
   CLean up deployment :
   $ ./provision-deployment delete

# Kubernetes manifest of deployed app consist of :
   - kustomization.yaml
   - mysql-deployment.yaml
   - wordpress-deployment.yaml

# Security control in mind
  I'm just configure the creation of mysql user to be used as database connections in wordpress, only to protect root user used by defaut

# Refrences
  - https://cloud.google.com/kubernetes-engine/docs/tutorials/persistent-disk
