#/bin/bash

if [[ -z $1 ]]; then
	echo -e "\n*** Image Name missing.\nUsage: $0 <image-name>\n"
	exit 1
fi

echo "-- Container Ip address --"
docker inspect --format '{{ .NetworkSettings.IPAddress }}' $1

echo -e "\n-- Kitematic ip address --"
docker-machine ip default

exit 0