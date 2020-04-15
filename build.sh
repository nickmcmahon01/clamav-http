#!/bin/bash

images=(
	"clamav"
	"clamav-http"
	"clamav-notify"
	)

docker login -u="ukhomeofficedigital+acp_clamav" -p=${DOCKER_PASSWORD} quay.io

for var in "${images[@]}"
do
  docker build -t quay.io/ukhomeofficedigital/acp-$var:${DRONE_COMMIT_SHA} $var --no-cache
done