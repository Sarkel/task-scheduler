-- User triggers
CREATE TRIGGER User_set_dates
BEFORE INSERT OR UPDATE
ON Task_scheduler.User
FOR EACH ROW
EXECUTE PROCEDURE Task_scheduler.set_dates();

CREATE TRIGGER User_setup_name
BEFORE INSERT OR UPDATE OF "First_Name", "Last_Name"
ON Task_scheduler.User
FOR EACH ROW
EXECUTE PROCEDURE Task_scheduler.setup_name();

-- Task triggers
CREATE TRIGGER Task_set_dates
BEFORE INSERT OR UPDATE
ON Task_scheduler.Task
FOR EACH ROW
EXECUTE PROCEDURE Task_scheduler.set_dates();


-- Dashboard triggers
CREATE TRIGGER Dashboard_set_dates
BEFORE INSERT OR UPDATE
ON Task_scheduler.Dashboard
FOR EACH ROW
EXECUTE PROCEDURE Task_scheduler.set_dates();


-- Role triggers
CREATE TRIGGER Role_set_dates
BEFORE INSERT OR UPDATE
ON Task_scheduler.Role
FOR EACH ROW
EXECUTE PROCEDURE Task_scheduler.set_dates();


-- Role triggers
CREATE TRIGGER Acceptance_set_dates
BEFORE INSERT OR UPDATE
ON Task_scheduler.Acceptance
FOR EACH ROW
EXECUTE PROCEDURE Task_scheduler.set_dates();


-- Role triggers
CREATE TRIGGER Penalty_set_dates
BEFORE INSERT OR UPDATE
ON Task_scheduler.Penalty
FOR EACH ROW
EXECUTE PROCEDURE Task_scheduler.set_dates();