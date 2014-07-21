
CREATE TABLE students
(
  id serial NOT NULL,
  firstname character(15),
  secondname character(15),
  PRIMARY KEY (id)
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
  FOREIGN KEY (attrid) REFERENCES attributes (id) ,
  FOREIGN KEY (studid) REFERENCES students (id)
);


CREATE TABLE feedbackers
(
  id serial NOT NULL,
  firstname character(20),
  secondname character(20),
  PRIMARY KEY (id)
);

CREATE TABLE reviews
(
  studid integer NOT NULL,
  feedbid integer NOT NULL,
  id serial NOT NULL,
  status smallint,
  critid integer NOT NULL,
  comment text,
  date date,
  PRIMARY KEY (id),
  FOREIGN KEY (feedbid)   REFERENCES feedbackers (id),
  FOREIGN KEY (studid)    REFERENCES students (id)
);

CREATE TABLE criteria
(
  id serial NOT NULL,
  criterion character(20),
  value text,
  PRIMARY KEY (id),
  FOREIGN KEY (id)   REFERENCES criteria (id)
);


CREATE TABLE studentsandcurators
(
  studid integer NOT NULL,
  curid integer NOT NULL,
  FOREIGN KEY (curid)    REFERENCES feedbackers (id),
  FOREIGN KEY (studid)   REFERENCES students (id)
);

CREATE TABLE studentsandinterviewers
(
  studid integer NOT NULL,
  intervid integer NOT NULL,
  FOREIGN KEY (intervid)  REFERENCES feedbackers (id),
  FOREIGN KEY (studid)    REFERENCES students (id)
);

CREATE TABLE projects
(
  id serial NOT NULL,
  studid integer NOT NULL,
  projname character(30),
  curid integer NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (studid)    REFERENCES students (id),
  FOREIGN KEY (curid)   REFERENCES feedbackers (id)
);
