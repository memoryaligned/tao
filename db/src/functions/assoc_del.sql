--
-- Deletes or the association (id1, atype, id2)
-- and its inverse if defined.
--
-- SELECT assoc_del(1, 'CHECKIN', 2, now(), '{k: v}');
--
CREATE OR REPLACE FUNCTION assoc_del(
   in_id1          NUMERIC
 , in_atype        VARCHAR(50)
 , in_id2          NUMERIC
 , in_tstz         TIMESTAMP WITH TIME ZONE
) RETURNS VOID AS $$
DECLARE
BEGIN

  DELETE FROM tao.assoc_tbl
   WHERE id1   = in_id1
     AND atype = in_atype
     AND id2   = in_id2
     AND tstz  = in_tstz;

  IF in_atype = 'CHECKIN' THEN
  DELETE FROM tao.assoc_tbl
   WHERE id1   = in_id2
     AND atype = 'LOC'
     AND id2   = in_id1
     AND tstz  = in_tstz;
  END IF;

END;
$$ LANGUAGE PLPGSQL;
