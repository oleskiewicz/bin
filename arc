#!/bin/sh -e
# arc - archive

_usage() {
	cat <<EOF
usage:
	arc directory    - archives
	arc -a directory - archives
	arc -c archive   - checks
	arc -d archive   - unpacks
EOF
}

_archive() {
  tar cvf - "$1" |
		xz -9ce |
		gpg -e -o "$(date +%Y%m%d)-$(basename $1).tar.xz.gpg"
}

_unarchive() {
	gpg -d "$1" |
		xz -d |
		tar xvf -
}

_check() {
	gpg -d "$1" |
		xz -d |
		tar tf -
}

[ $# -eq 0 ] && {
	_usage
	exit 1
}

case "$1" in
-a)
	shift
	_archive "$1"
	;;
-c)
	shift
	_check "$1"
	;;
-d)
	shift
	_unarchive "$1"
	;;
-h)
	_usage
	;;
*)
	_archive "$1"
	;;
esac
