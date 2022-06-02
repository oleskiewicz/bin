#!/bin/sh -e
#
# cr - run inside a container
#   command-line: cr python:3 python
#   shebang: env -S dr python:3 python

docker run -i -t --rm                \
	-e DISPLAY="$(hostname):0"       \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-v "$(PWD):/src"                 \
	-w "/src"                        \
	--entrypoint ""                  \
	"$@"
