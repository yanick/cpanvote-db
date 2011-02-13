-- Convert schema 'sql/_source/deploy/4/001-auto.yml' to 'sql/_source/deploy/3/001-auto.yml':;

;
BEGIN;

;
ALTER TABLE distributions ADD COLUMN foo character varying(30);

;
ALTER TABLE distributions ALTER COLUMN distname TYPE character varying(30);

;

COMMIT;

