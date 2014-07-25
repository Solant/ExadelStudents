
CREATE TABLE users
(
  id bigserial NOT NULL UNIQUE ,
  login varchar(40) NOT NULL UNIQUE ,
  password varchar(70) NOT NULL,
  enabled boolean NOT NULL DEFAULT TRUE,
  firstname varchar(30),
  secondname varchar(30),
  status varchar(20) NOT NULL DEFAULT 'student',
  skype varchar(30),
  telephone varchar(30),
  email varchar(30),
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
  groupname varchar(40),
  status varchar(30) not null default 'for_everybody',
  PRIMARY KEY (id)
);

CREATE TABLE attributes
(
  id bigserial NOT NULL UNIQUE,
  groupid bigint not null,
  attrname varchar(40),
  status varchar(30) NOT NULL DEFAULT 'for_everybody',
  type varchar(20),
  PRIMARY KEY (id),
  FOREIGN KEY (groupid)  REFERENCES groups (id)
);

CREATE TABLE values
(
  id bigserial NOT NULL UNIQUE,
  studid bigint NOT NULL,
  attrid bigint NOT NULL,
  value text,
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
  working_on_real_project varchar(30),
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
