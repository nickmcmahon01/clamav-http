#!/bin/sh


docker login -u="ukhomeofficedigital+acp_clamav" -p=${DOCKER_PASSWORD} quay.io

for var in "clamav clamav-http clamav-notify"
do
  docker build -t quay.io/ukhomeofficedigital/acp-$var:${DRONE_COMMIT_SHA} $var --no-cache
done