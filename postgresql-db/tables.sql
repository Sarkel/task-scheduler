CREATE TABLE Task_scheduler.User (
  "Id"            SERIAL                   NOT NULL,
  "Name"          VARCHAR(161)             NOT NULL,
  "First_Name"    VARCHAR(80)              NOT NULL,
  "Last_Name"     VARCHAR(80)              NOT NULL,
  "Email"         Task_scheduler.email     NOT NULL UNIQUE,
  "Password"      TEXT                     NOT NULL,
  "Password_Seed" VARCHAR(15)              NOT NULL,
  "Dashboard"     INT                      NOT NULL,
  "Created_date"  TIMESTAMP WITH TIME ZONE NOT NULL,
  "Modified_date" TIMESTAMP WITH TIME ZONE NOT NULL,
  CONSTRAINT User_pk PRIMARY KEY ("Id")
  );


CREATE TABLE Task_scheduler.Task (
  "Id"            SERIAL                   NOT NULL,
  "Name"          VARCHAR(80)              NOT NULL,
  "Description"   VARCHAR(255),
  "Start"         TIMESTAMP WITH TIME ZONE NOT NULL,
  "End"           TIMESTAMP WITH TIME ZONE NOT NULL,
  "Owner"         INT                      NOT NULL,
  "Done"          BOOLEAN                  NOT NULL DEFAULT 'false',
  "Created_date"  TIMESTAMP WITH TIME ZONE NOT NULL,
  "Modified_date" TIMESTAMP WITH TIME ZONE NOT NULL,
  CONSTRAINT Task_pk PRIMARY KEY ("Id"),
  CONSTRAINT Start_grater_then_end CHECK("Start" <= "End")
);


CREATE TABLE Task_scheduler.Dashboard (
  "Id"             SERIAL                   NOT NULL,
  "Created_By"     INT                      NOT NULL,
  "Name"           VARCHAR(80)              NOT NULL,
  "Role"           INT                      NOT NULL,
  "Description"    VARCHAR(255),
  "Created_date	" TIMESTAMP WITH TIME ZONE NOT NULL,
  "Modified_date"  TIMESTAMP WITH TIME ZONE NOT NULL,
  CONSTRAINT Dashboard_pk PRIMARY KEY ("Id")
);


CREATE TABLE Task_scheduler.Role (
  "Id"             SERIAL                   NOT NULL,
  "Name"           VARCHAR(80)              NOT NULL,
  "Created_date	" TIMESTAMP WITH TIME ZONE NOT NULL,
  "Modified_date"  TIMESTAMP WITH TIME ZONE NOT NULL,
  CONSTRAINT Role_pk PRIMARY KEY ("Id")
);


CREATE TABLE Task_scheduler.Acceptance (
  "Id"              SERIAL                   NOT NULL,
  "User"            INT                      NOT NULL,
  "Task"            INT                      NOT NULL,
  "Acceptance_Date" TIMESTAMP WITH TIME ZONE NOT NULL,
  "Created_date"    TIMESTAMP WITH TIME ZONE NOT NULL,
  "Modified_date"   TIMESTAMP WITH TIME ZONE NOT NULL,
  CONSTRAINT Acceptance_pk PRIMARY KEY ("Id")
);


CREATE TABLE Task_scheduler.Penalty (
  "Id"            INT                      NOT NULL,
  "User"          INT                      NOT NULL,
  "Task"          INT                      NOT NULL,
  "Amound"        MONEY                    NOT NULL,
  "Description"   VARCHAR(255),
  "Created_date"  TIMESTAMP WITH TIME ZONE NOT NULL,
  "Modified_date" TIMESTAMP WITH TIME ZONE NOT NULL,
  CONSTRAINT Penalty_pk PRIMARY KEY ("Id")
);

CREATE TABLE Task_scheduler.Recurrence (
  "Id" serial NOT NULL,
  "Name" varchar(80) NOT NULL,
  "Dashboard" int,
  CONSTRAINT Recurrence_pk PRIMARY KEY ("Id")
);

ALTER TABLE Task_scheduler.User ADD CONSTRAINT "User_fk0" FOREIGN KEY ("Dashboard") REFERENCES Task_scheduler.Dashboard ("Id");

ALTER TABLE Task_scheduler.Task ADD CONSTRAINT "Task_fk0" FOREIGN KEY ("Owner") REFERENCES Task_scheduler.User ("Id");
ALTER TABLE Task_scheduler.Task ADD CONSTRAINT "Task_fk1" FOREIGN KEY ("Recurrence") REFERENCES Task_scheduler.Recurrence("Id");

ALTER TABLE Task_scheduler.Dashboard ADD CONSTRAINT "Dashboard_fk0" FOREIGN KEY ("Created_By") REFERENCES Task_scheduler.User ("Id");
ALTER TABLE Task_scheduler.Dashboard ADD CONSTRAINT "Dashboard_fk1" FOREIGN KEY ("Role") REFERENCES Task_scheduler.Role ("Id");


ALTER TABLE Task_scheduler.Acceptance ADD CONSTRAINT "Acceptance_fk0" FOREIGN KEY ("User") REFERENCES Task_scheduler.User ("Id");
ALTER TABLE Task_scheduler.Acceptance ADD CONSTRAINT "Acceptance_fk1" FOREIGN KEY ("Task") REFERENCES Task_scheduler.Task ("Id");

ALTER TABLE Task_scheduler.Penalty ADD CONSTRAINT "Penalty_fk0" FOREIGN KEY ("User") REFERENCES Task_scheduler.User ("Id");
ALTER TABLE Task_scheduler.Penalty ADD CONSTRAINT "Penalty_fk1" FOREIGN KEY ("Task") REFERENCES Task_scheduler.Task ("Id");

ALTER TABLE Task_scheduler.Recurrence ADD CONSTRAINT "Recurrence_fk0" FOREIGN KEY ("Dashboard") REFERENCES Task_scheduler.Dashboard("Id");
