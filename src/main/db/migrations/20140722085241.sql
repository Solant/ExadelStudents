
CREATE TABLE users
(
  id serial NOT NULL,
  login character(40) NOT NULL,
  password character(60) NOT NULL,
  enabled boolean NOT NULL DEFAULT FALSE,
  firstname character(20),
  secondname character(20),
  status smallint NOT NULL DEFAULT 3,
  PRIMARY KEY (id)
);

CREATE TABLE user_roles (
  user_role_id INTEGER NOT NULL ,
  userid INTEGER NOT NULL,
  ROLE CHARACTER(30) NOT NULL,
  PRIMARY KEY (user_role_id),
  CONSTRAINT fk_userId FOREIGN KEY (userid) REFERENCES users (id)
  );


CREATE TABLE groups
(
  id serial NOT NULL,
  attrId integer NOT NULL,
  groupname character(40),
  PRIMARY KEY (id)
);

CREATE TABLE attributes
(
  id serial NOT NULL,
  groupid integer  not null,
  attrname character(40),
  status smallint,
  type text,
  PRIMARY KEY (id),
  FOREIGN KEY (groupid)  REFERENCES groups (id)
);

CREATE TABLE values
(
  studid integer NOT NULL,
  attrid integer NOT NULL,
  id serial NOT NULL,
  value character(40),
  PRIMARY KEY (id),
  FOREIGN KEY (attrid) REFERENCES attributes (id),
  FOREIGN KEY (studid) REFERENCES users (id)
);

CREATE TABLE reviews
(
  studid integer NOT NULL,
  feedbid integer NOT NULL,
  id serial NOT NULL,
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
  studid integer NOT NULL,
  curid integer NOT NULL,
  FOREIGN KEY (curid)    REFERENCES users (id),
  FOREIGN KEY (studid)   REFERENCES users (id)
);

CREATE TABLE studentsandinterviewers
(
  studid integer NOT NULL,
  intervid integer NOT NULL,
  FOREIGN KEY (intervid)  REFERENCES users (id),
  FOREIGN KEY (studid)    REFERENCES users (id)
);

CREATE TABLE projects
(
  id serial NOT NULL,
  studid integer NOT NULL,
  projname character(30),
  curid integer NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (studid)  REFERENCES users (id),
  FOREIGN KEY (curid)   REFERENCES users (id)
);
