CREATE SCHEMA IF NOT EXISTS tao;

--
-- OBJECTS TABLE
--
CREATE TABLE IF NOT EXISTS tao.obj_tbl (
  id     SERIAL PRIMARY KEY,
  otype  VARCHAR(50) NOT NULL,
  kv     VARCHAR(4000) NOT NULL
);

CREATE ROLE tao_obj_tbl_s;
CREATE ROLE tao_obj_tbl_si;
CREATE ROLE tao_obj_tbl_all;

GRANT SELECT 
   ON TABLE tao.obj_tbl TO tao_obj_tbl_s;

GRANT SELECT
    , INSERT 
   ON TABLE tao.obj_tbl TO tao_obj_tbl_si;

GRANT SELECT
    , INSERT
    , UPDATE 
    ON TABLE tao.obj_tbl TO tao_obj_tbl_all;

--
-- ASSOCIATIONS TABLE
--
CREATE TABLE IF NOT EXISTS tao.assoc_tbl (
  id1    NUMERIC NOT NULL,
  atype  VARCHAR(50) NOT NULL,
  id2    NUMERIC NOT NULL,
  tstz   TIMESTAMP WITH TIME ZONE NOT NULL,
  kv     VARCHAR(4000) NOT NULL
);

CREATE UNIQUE INDEX CONCURRENTLY tao_assoc_tbl_uq
    ON tao.assoc_tbl(id1, atype, id2, tstz);

ALTER TABLE tao.assoc_tbl
  ADD CONSTRAINT tao_assoc_tbl_uq UNIQUE USING INDEX tao_assoc_tbl_uq;

CREATE ROLE tao_assoc_tbl_s;
CREATE ROLE tao_assoc_tbl_si;
CREATE ROLE tao_assoc_tbl_all;

GRANT SELECT 
   ON TABLE tao.assoc_tbl TO tao_assoc_tbl_s;

GRANT SELECT
    , INSERT
   ON TABLE tao.assoc_tbl TO tao_assoc_tbl_si;

GRANT SELECT
    , INSERT
    , UPDATE
    , DELETE
   ON TABLE tao.assoc_tbl TO tao_assoc_tbl_all;
