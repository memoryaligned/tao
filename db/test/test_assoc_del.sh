#!/bin/bash

. ./util/test.sh

function test() {

psql template1 << END_SESSION
SELECT assoc_add(1, 'CHECKIN', 2, '2024-01-01T01:01:01-5', '{k: v}') AS IGNORE;

SELECT COUNT(*) AS must_be_2
  FROM tao.assoc_tbl;


SELECT assoc_del(1, 'CHECKIN', 2, '2024-01-01T01:01:01-5') AS IGNORE;

SELECT COUNT(*) AS must_be_0
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
