docker images | grep " [months|days|weeks]* ago" | awk '{print $3}' | xargs docker rmi
