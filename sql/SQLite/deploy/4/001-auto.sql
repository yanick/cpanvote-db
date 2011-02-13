-- 
-- Created by SQL::Translator::Producer::SQLite
-- Created on Sat Feb 12 16:35:05 2011
-- 

;
BEGIN TRANSACTION;
--
-- Table: distributions
--
CREATE TABLE distributions (
  id INTEGER PRIMARY KEY NOT NULL,
  distname varchar(150) NOT NULL
);
CREATE UNIQUE INDEX unique_distname ON distributions (distname);
--
-- Table: sessions
--
CREATE TABLE sessions (
  id varchar(72) NOT NULL,
  session_data text,
  expires integer,
  PRIMARY KEY (id)
);
--
-- Table: users
--
CREATE TABLE users (
  id INTEGER PRIMARY KEY NOT NULL,
  username varchar(20) NOT NULL
);
CREATE UNIQUE INDEX unique_username ON users (username);
--
-- Table: auth
--
CREATE TABLE auth (
  user_id integer,
  protocol varchar(10) NOT NULL,
  credential varchar(20) NOT NULL,
  PRIMARY KEY (protocol, credential)
);
CREATE INDEX auth_idx_user_id ON auth (user_id);
--
-- Table: tags
--
CREATE TABLE tags (
  id INTEGER PRIMARY KEY NOT NULL,
  user_id integer,
  name varchar(20) NOT NULL
);
CREATE INDEX tags_idx_user_id ON tags (user_id);
CREATE UNIQUE INDEX unique_row ON tags (user_id, name);
--
-- Table: votes
--
CREATE TABLE votes (
  user_id integer NOT NULL,
  dist_id integer NOT NULL,
  vote integer,
  comment varchar(140),
  instead_id integer,
  last_change timestamp,
  PRIMARY KEY (user_id, dist_id)
);
CREATE INDEX votes_idx_dist_id ON votes (dist_id);
CREATE INDEX votes_idx_instead_id ON votes (instead_id);
CREATE INDEX votes_idx_user_id ON votes (user_id);
--
-- Table: tag_dist
--
CREATE TABLE tag_dist (
  tag_id integer NOT NULL,
  dist_id integer NOT NULL,
  PRIMARY KEY (tag_id, dist_id)
);
CREATE INDEX tag_dist_idx_dist_id ON tag_dist (dist_id);
CREATE INDEX tag_dist_idx_tag_id ON tag_dist (tag_id);
COMMIT