#!/bin/bash

. ./etc/test.cfg

if [ ! -d ${DATADIR:-'foo'} ]; then
  ./scripts/createdb.sh
fi

pg_ctl -D ${DATADIR:-pg_data} start
