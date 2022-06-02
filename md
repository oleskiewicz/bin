#!/bin/sh -e
#
# md -- render markdown

lowdown -Tman "${1:--}" | mandoc | less
