#!/bin/bash

. ./util/test.sh

function test() {

psql template1 << END_SESSION
SELECT assoc_add(1, 'CHECKIN', 2, now(), '{k: v}') AS IGNORE;

SELECT COUNT(*) AS must_be_2
  FROM tao.assoc_tbl;

DELETE FROM tao.assoc_tbl;

SELECT assoc_add(1, 'NOT_CHECKIN', 2, now(), '{k: v}') AS IGNORE;

SELECT COUNT(*) AS must_be_1
  FROM tao.assoc_tbl;

END_SESSION
}

########
# main #
########

setup
test
teardown

exit $?
