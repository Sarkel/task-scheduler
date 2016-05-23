CREATE DOMAIN Task_scheduler.email AS VARCHAR(255) CHECK (
  VALUE ~ '^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$'
);
COMMENT ON DOMAIN Task_scheduler.email IS 'Domain represent valid email.';