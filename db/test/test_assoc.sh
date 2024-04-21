#!/bin/bash

. ./util/test.sh

function test() {

psql template1 << END
SELECT assoc_add(1, 'CHECKIN', 2, now(), '{k: v}');

SELECT COUNT(*) AS should_be_2
  FROM tao.assoc_tbl;

DELETE FROM tao.assoc_tbl;

SELECT assoc_add(1, 'NOT_CHECKIN', 2, now(), '{k: v}');

SELECT COUNT(*) AS should_be_1
  FROM tao.assoc_tbl;
END

}

########
# main #
########

setup
test
teardown

exit $?
