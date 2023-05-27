#!/bin/bash
cat index_var.html | sed "s/temp.*/${DOCKER_TAG}/g" > index.html
