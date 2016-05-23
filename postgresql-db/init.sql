CREATE SCHEMA Task_scheduler;
COMMENT ON SCHEMA Task_scheduler IS 'Namespace for task scheduler database.';

\i domains.sql;
\i tables.sql;
\i functions.sql;
\i triggers.sql;
\i indexes.sql;
\i views.sql;
