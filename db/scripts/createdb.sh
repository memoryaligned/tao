#!/bin/bash

. ./etc/test.cfg

initdb -D ${DATADIR:-./pg_data}

exit $?
