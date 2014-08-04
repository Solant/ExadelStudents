CREATE TABLE technologies
(
  id bigserial NOT NULL UNIQUE,
  technology_name varchar(30) UNIQUE,
  PRIMARY KEY(id)
);

CREATE TABLE ratings
(
  id bigserial NOT NULL UNIQUE,
  review_id bigint NOT NULL,
  technology_id bigint NOT NULL,
  rating smallint,
  PRIMARY KEY(id),
  FOREIGN KEY (review_id)    REFERENCES reviews (id),
  FOREIGN KEY (technology_id)   REFERENCES technologies (id),
  UNIQUE(review_id, technology_id)
);