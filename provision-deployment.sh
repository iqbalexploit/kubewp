#!/bin/bash

#minikube check
#ps ax | grep -v grep | grep minikube > /dev/null
#[ $?  -eq "0" ] && echo "minikube is running" || echo "minikube is not running"

#Ensure kubernetes has installed
#which kubectl > /dev/null
#[ $?  -eq "0" ] && echo "kubernetes is installed" || echo "kubernetes is not installed"

#Ensure docker has installed
#which docker > /dev/null
#[ $?  -eq "0" ] && echo "docker is installed" || echo "docker is not installed"

if [[ $1 == "delete" ]]
then
  kubectl delete -k ./
  exit
fi

checkRunning() {
  if ps ax | grep -v grep | grep $1 > /dev/null
  then
    echo "OK: $1 service running"
    return 1
  else
    echo "FAILED: $1 is not running"
    return 0
  fi
}


checkInstalled() {
  if which $1 > /dev/null
  then
    echo "OK: $1 already installed"
    return 1
  else
    echo "FAIL: $1 has not installed"
    return 0
  fi
}

collectInformation() {
  echo -e "\nCollecting information...."
  sleep 5
  echo -e "\nVerifying that a PersistentVolume" && kubectl get pvc
  echo -e "\nVerifying that the Pod is running: waiting for 15s" && sleep 5 && kubectl get pods
  echo -e "\nVerifying that the Service is running" && kubectl get services wordpress
  echo -e "\nIP Address for the WordPress Service" && minikube service wordpress --url  
}

if checkInstalled minikube || checkInstalled kubectl || checkInstalled docker || checkRunning minikube
then
  echo "Please fixed an error"
else
  echo "Everything is ok"
  echo "Deploying is processed...."
  kubectl create -k ./
  collectInformation
fi
