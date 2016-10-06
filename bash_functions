function rdp {
	rdesktop -r sound:local -g 1920x1050 -a 32 -z -P $*
}

function rdp-dev {
	rdp -u administrator 10.1.1.152 $*
}

function docker-build {
	docker build --force-rm $*
}

function docker-run {
	docker run --rm $*
}

function docker-run-it {
	docker-run -i -it --entrypoint=/bin/bash $*
}

function docker-rm-containers {
	docker rm $(docker ps -a -q)
}

function docker-rm-images {
	docker rmi $(docker images -q)
}

function docker-pid {
	docker inspect --format '{{ .State.Pid }}' "$@"
}

function docker-ip {
	docker inspect --format '{{ .NetworkSettings.IPAddress }}' "$@"
}
