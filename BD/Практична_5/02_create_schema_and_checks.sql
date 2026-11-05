-- Запускати в базі college під college_user.
CREATE SCHEMA IF NOT EXISTS college AUTHORIZATION college_user;
SELECT version();
SELECT current_database();
SELECT current_user;
SELECT schema_name FROM information_schema.schemata ORDER BY schema_name;
SELECT pg_encoding_to_char(encoding) AS encoding FROM pg_database WHERE datname = 'college';
