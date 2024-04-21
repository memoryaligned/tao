DROP SCHEMA tao CASCADE;

DROP ROLE tao_obj_tbl_s;
DROP ROLE tao_obj_tbl_si;
DROP ROLE tao_obj_tbl_all;

DROP ROLE tao_assoc_tbl_s;
DROP ROLE tao_assoc_tbl_si;
DROP ROLE tao_assoc_tbl_all;

DROP FUNCTION IF EXISTS assoc_add(
   id1          NUMERIC
 , association  VARCHAR(50)
 , id2          NUMERIC
 , tstz         TIMESTAMP WITH TIME ZONE
 , kv           VARCHAR(4000)
);
