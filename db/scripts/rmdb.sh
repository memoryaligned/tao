#!/bin/bash

. ./etc/test.cfg

./scripts/stopdb.sh

rm -rf ${DATADIR:-warning_datadir_is_not_set_in_the_config}

exit $?
