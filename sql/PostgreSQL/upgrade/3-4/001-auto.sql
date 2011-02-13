-- Convert schema 'sql/_source/deploy/3/001-auto.yml' to 'sql/_source/deploy/4/001-auto.yml':;

;
BEGIN;

;
ALTER TABLE distributions DROP COLUMN foo;

;
ALTER TABLE distributions ALTER COLUMN distname TYPE character varying(150);

;

COMMIT;

