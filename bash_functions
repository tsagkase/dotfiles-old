#
# VIM related (tips from https://www.rohanjain.in/yet-another-vim-productivity-post-server-client/)
#
# Set the name of vim session the terminal is tied up to
function eset {
    export VI_SERVER=$1
}

# Fire up a new server according to the argument supplied
function vs {
    NAME=${WORKSPACE_NAME:-$1}
    eset $NAME
    vim --servername $VI_SERVER
}

# Open up the files in the environment Vim server.
function es {
    vim --servername $VI_SERVER --remote-silent $*
}

#
# Remote desktop related
#
function rdp {
	rdesktop -r sound:local -g 1920x1050 -a 32 -z -P $*
}

function rdp-dev {
	rdp -u administrator 10.1.1.152 $*
}

#
# Docker related
#
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
