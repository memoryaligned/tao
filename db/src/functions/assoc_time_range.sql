--
-- Get the associations by time range
--
CREATE OR REPLACE FUNCTION assoc_time_range(
    id1         NUMERIC
  , atype       VARCHAR(50)
  , id2         NUMERIC
  , start_tstz  TIMESTAMP WITH TIME ZONE
  , stop_tstz   TIMESTAMP WITH TIME ZONE
) RETURNS VOID AS $$
DECLARE
BEGIN

END;
$$ LANGUAGE PLPGSQL;
