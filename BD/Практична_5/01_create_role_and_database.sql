-- Запускати у psql як postgres, у базі postgres.
-- Перед запуском у ЛОКАЛЬНІЙ копії замініть пароль-плейсхолдер.
-- У разі повторного запуску спершу перевірте, чи роль/база вже існують.
CREATE ROLE college_user LOGIN CREATEDB PASSWORD 'REPLACE_WITH_OWN_PASSWORD';
CREATE DATABASE college WITH OWNER = college_user ENCODING = 'UTF8' TEMPLATE = template0;
