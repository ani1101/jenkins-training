#!/bin/bash
cat index_var.html | sed  "s/temp.*/${DOCKER_TAG}/g" > index.html
cat deploy-pod.yml | sed "s/repo.*/${DOCKER_TAG}/g" > deploy.yml
