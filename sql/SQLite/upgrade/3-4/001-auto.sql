-- Convert schema 'sql/_source/deploy/3/001-auto.yml' to 'sql/_source/deploy/4/001-auto.yml':;

;
BEGIN;

;
CREATE TEMPORARY TABLE distributions_temp_alter (
  id INTEGER PRIMARY KEY NOT NULL,
  distname varchar(150) NOT NULL
);

;
INSERT INTO distributions_temp_alter SELECT id, distname FROM distributions;

;
DROP TABLE distributions;

;
CREATE TABLE distributions (
  id INTEGER PRIMARY KEY NOT NULL,
  distname varchar(150) NOT NULL
);

;
CREATE UNIQUE INDEX unique_distname02 ON distributions (distname);

;
INSERT INTO distributions SELECT id, distname FROM distributions_temp_alter;

;
DROP TABLE distributions_temp_alter;

;

COMMIT;

