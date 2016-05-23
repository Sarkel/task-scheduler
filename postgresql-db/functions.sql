CREATE FUNCTION Task_scheduler.set_dates()
  RETURNS TRIGGER AS '
DECLARE
  ct TIMESTAMP;
BEGIN
  ct := (SELECT now());
  IF (TG_OP = ''INSERT'')
  THEN
    NEW.Created_date := ct;
  ELSEIF (TG_OP = ''UPDATE'')
    THEN
      NEW.Modified_date := ct;
  END IF;
  RETURN NEW;
END;
' LANGUAGE plpgsql;


CREATE FUNCTION Task_scheduler.setup_name()
  RETURNS TRIGGER AS '
DECLARE
  firstName VARCHAR(80);
  lastName  VARCHAR(80);
  name      VARCHAR(161);
BEGIN
  firstName := NEW.First_Name;
  lastName := NEW.Last_Name;
  name := concat_ws('' '', firstName, lastName);
  IF (length(name) = 161)
  THEN
    RETURN NEW;
  ELSE
    RETURN NULL;
  END IF;
END;
' LANGUAGE plpgsql;

CREATE FUNCTION Task_scheduler.sum_penalty(INT) RETURNS MONEY AS '
  SELECT sum(p.Amound) FROM Task_scheduler.Penalty AS p WHERE p.User = $1;
' LANGUAGE SQL;