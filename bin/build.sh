#!/bin/sh


docker login -u="ukhomeofficedigital+acp_clamav" -p=${DOCKER_PASSWORD} quay.io

for image in "clamav clamav-http clamav-notify"
do
  docker build --no-cache -t "quay.io/ukhomeofficedigital/acp-$image:$DRONE_COMMIT_SHA" "$image"
done