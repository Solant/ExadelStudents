
CREATE TABLE notifications
(
  id bigserial NOT NULL UNIQUE,
  user_id bigint NOT NULL,
  time_when_sent TIMESTAMP NOT NULL,
  time_when_read TIMESTAMP,
  title varchar(100),
  sender varchar(30),
  text text NOT NULL,
  have_been_read boolean DEFAULT FALSE,
  PRIMARY KEY(id),
  FOREIGN KEY (user_id)  REFERENCES users (id)
);