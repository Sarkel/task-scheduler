-- Task indexes
CREATE INDEX Task_end_idx ON Task_scheduler.Task ("End");
CREATE INDEX Task_start_idx ON Task_scheduler.Task ("Start");
CREATE INDEX Task_name_idx ON Task_scheduler.Task ("Name");
CREATE INDEX Task_owner_idx ON Task_scheduler.Task ("Owner");

-- User indexes
CREATE INDEX User_name_idx ON Task_scheduler.User ("Name");
CREATE INDEX User_email_idx ON Task_scheduler.User ("Email");

-- Penalty indexes
CREATE INDEX Penalty_user_idx ON Task_scheduler.Penalty ("User");
CREATE INDEX Penalty_task_idx ON Task_scheduler.Penalty ("Task");