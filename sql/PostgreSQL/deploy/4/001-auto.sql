-- 
-- Created by SQL::Translator::Producer::PostgreSQL
-- Created on Sat Feb 12 16:35:05 2011
-- 
;
--
-- Table: distributions
--
CREATE TABLE "distributions" (
  "id" serial NOT NULL,
  "distname" character varying(150) NOT NULL,
  PRIMARY KEY ("id"),
  CONSTRAINT "unique_distname" UNIQUE ("distname")
);

;
--
-- Table: sessions
--
CREATE TABLE "sessions" (
  "id" character varying(72) NOT NULL,
  "session_data" text,
  "expires" integer,
  PRIMARY KEY ("id")
);

;
--
-- Table: users
--
CREATE TABLE "users" (
  "id" serial NOT NULL,
  "username" character varying(20) NOT NULL,
  PRIMARY KEY ("id"),
  CONSTRAINT "unique_username" UNIQUE ("username")
);

;
--
-- Table: auth
--
CREATE TABLE "auth" (
  "user_id" integer,
  "protocol" character varying(10) NOT NULL,
  "credential" character varying(20) NOT NULL,
  PRIMARY KEY ("protocol", "credential")
);
CREATE INDEX "auth_idx_user_id" on "auth" ("user_id");

;
--
-- Table: tags
--
CREATE TABLE "tags" (
  "id" serial NOT NULL,
  "user_id" integer,
  "name" character varying(20) NOT NULL,
  PRIMARY KEY ("id"),
  CONSTRAINT "unique_row" UNIQUE ("user_id", "name")
);
CREATE INDEX "tags_idx_user_id" on "tags" ("user_id");

;
--
-- Table: votes
--
CREATE TABLE "votes" (
  "user_id" integer NOT NULL,
  "dist_id" integer NOT NULL,
  "vote" integer,
  "comment" character varying(140),
  "instead_id" integer,
  "last_change" timestamp,
  PRIMARY KEY ("user_id", "dist_id")
);
CREATE INDEX "votes_idx_dist_id" on "votes" ("dist_id");
CREATE INDEX "votes_idx_instead_id" on "votes" ("instead_id");
CREATE INDEX "votes_idx_user_id" on "votes" ("user_id");

;
--
-- Table: tag_dist
--
CREATE TABLE "tag_dist" (
  "tag_id" integer NOT NULL,
  "dist_id" integer NOT NULL,
  PRIMARY KEY ("tag_id", "dist_id")
);
CREATE INDEX "tag_dist_idx_dist_id" on "tag_dist" ("dist_id");
CREATE INDEX "tag_dist_idx_tag_id" on "tag_dist" ("tag_id");

;
--
-- Foreign Key Definitions
--

;
ALTER TABLE "auth" ADD FOREIGN KEY ("user_id")
  REFERENCES "users" ("id") DEFERRABLE;

;
ALTER TABLE "tags" ADD FOREIGN KEY ("user_id")
  REFERENCES "users" ("id") DEFERRABLE;

;
ALTER TABLE "votes" ADD FOREIGN KEY ("dist_id")
  REFERENCES "distributions" ("id") ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE;

;
ALTER TABLE "votes" ADD FOREIGN KEY ("instead_id")
  REFERENCES "distributions" ("id") DEFERRABLE;

;
ALTER TABLE "votes" ADD FOREIGN KEY ("user_id")
  REFERENCES "users" ("id") ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE;

;
ALTER TABLE "tag_dist" ADD FOREIGN KEY ("dist_id")
  REFERENCES "distributions" ("id") ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE;

;
ALTER TABLE "tag_dist" ADD FOREIGN KEY ("tag_id")
  REFERENCES "tags" ("id") ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE;

