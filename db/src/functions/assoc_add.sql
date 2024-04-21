--
-- Adds or overwrites the association (id1, atype, id2)
-- and its inverse if defined.
--
-- SELECT assoc_add(1, 'CHECKIN', 2, now(), '{k: v}');
--
CREATE OR REPLACE FUNCTION assoc_add(
   id1          NUMERIC
 , association  VARCHAR(50)
 , id2          NUMERIC
 , tstz         TIMESTAMP WITH TIME ZONE
 , kv           VARCHAR(4000)
) RETURNS VOID AS $$
DECLARE
BEGIN
  INSERT INTO tao.assoc_tbl(
     id1
   , atype
   , id2
   , tstz
   , kv
  ) VALUES (
     id1
   , association
   , id2
   , tstz
   , kv
  ); 

  IF association = 'CHECKIN' THEN
    INSERT INTO tao.assoc_tbl(
       id1
     , atype
     , id2
     , tstz
     , kv
    ) VALUES (
       id2
     , 'LOC'
     , id1
     , tstz
     , kv
    );
  END IF;

END;
$$ LANGUAGE PLPGSQL;
