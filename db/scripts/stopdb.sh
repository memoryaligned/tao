#!/bin/bash

. ./etc/test.cfg

pg_ctl -D ${DATADIR:-pg_data} stop
