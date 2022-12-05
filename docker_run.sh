#!/usr/bin/env bash
BUILD_SCRIPT=docker_build.sh
if test -f "$BUILD_SCRIPT" ; then
	echo "Found ${BUILD_SCRIPT}, building image."
	bash docker_build.sh
fi

IMAGE_EXISTS=$(docker images | grep dockeropenneuro)

if [ "$IMAGE_EXISTS" ]; then
	echo "Found image."
	echo "$IMAGE_EXISTS"
else
	echo "You need to build the dockeropenneuro image using the docker_build.sh script"
fi

docker run -it --rm --volume $PWD/download/:/download/ dockeropenneuro
