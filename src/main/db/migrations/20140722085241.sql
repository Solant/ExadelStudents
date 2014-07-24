
CREATE TABLE users
(
  id bigserial NOT NULL UNIQUE ,
  login varchar(40) NOT NULL UNIQUE ,
  password varchar(70) NOT NULL,
  enabled boolean NOT NULL DEFAULT FALSE,
  firstname varchar(20),
  secondname varchar(20),
  status varchar(20) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE user_roles (
  user_role_id bigserial NOT NULL UNIQUE,
  user_id bigint NOT NULL,
  ROLE varchar(30) NOT NULL,
  PRIMARY KEY (user_role_id),
  FOREIGN KEY (user_id) REFERENCES users(id)
  );


CREATE TABLE groups
(
  id bigserial NOT NULL UNIQUE ,
  attrId bigint NOT NULL,
  groupname varchar(40),
  PRIMARY KEY (id)
);

CREATE TABLE attributes
(
  id bigserial NOT NULL UNIQUE,
  groupid bigint not null,
  attrname varchar(40),
  status smallint,
  type text,
  PRIMARY KEY (id),
  FOREIGN KEY (groupid)  REFERENCES groups (id)
);

CREATE TABLE values
(
  id bigserial NOT NULL UNIQUE,
  studid bigint NOT NULL,
  attrid bigint NOT NULL,
  value varchar(40),
  PRIMARY KEY (id),
  FOREIGN KEY (attrid) REFERENCES attributes (id),
  FOREIGN KEY (studid) REFERENCES users (id)
);

CREATE TABLE reviews
(
  id bigserial NOT NULL UNIQUE,
  studid bigint NOT NULL,
  feedbid bigint NOT NULL,
  fromInterview boolean NOT NULL default FALSE,
  comment text,
  suitability boolean,
  work_attitude text,
  team_attitude text,
  prof_progress text,
  need_more_hours boolean,
  working_on_real_project smallint,
  billable boolean,
  date date,
  PRIMARY KEY (id),
  FOREIGN KEY (feedbid)   REFERENCES users (id),
  FOREIGN KEY (studid)    REFERENCES users (id)
);

CREATE TABLE studentsandcurators
(
  studid bigint NOT NULL,
  curid bigint NOT NULL,
  FOREIGN KEY (curid)    REFERENCES users (id),
  FOREIGN KEY (studid)   REFERENCES users (id)
);

CREATE TABLE studentsandinterviewers
(
  studid bigint NOT NULL,
  intervid bigint NOT NULL,
  FOREIGN KEY (intervid)  REFERENCES users (id),
  FOREIGN KEY (studid)    REFERENCES users (id)
);

CREATE TABLE projects
(
  id bigserial NOT NULL UNIQUE,
  studid bigint NOT NULL,
  projname varchar(30),
  curid bigint NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (studid)  REFERENCES users (id),
  FOREIGN KEY (curid)   REFERENCES users (id)
);
