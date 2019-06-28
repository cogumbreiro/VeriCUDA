#!/bin/bash
NAME=vericuda

if opam switch list -s | grep -q '^'$NAME'$'; then
  # Nothing to do
  true
else
  # Install if necessary
  opam switch create $NAME --packages cil=1.7.3 -y &&
  eval $(opam config env)
fi &&
# Enable the switch if necessary
if [ $(opam switch show) != $NAME ]; then
  opam switch $NAME &&
  eval $(opam config env)
fi &&
opam install extlib=1.7.6 why3=0.87.2 zlib=0.6 alt-ergo=0.99.1 -y &&
exit $?
