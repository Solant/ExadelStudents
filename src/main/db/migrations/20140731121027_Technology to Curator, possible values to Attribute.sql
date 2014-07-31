CREATE TABLE UsersAndTechnologies(
    feedbacker_id bigint NOT NULL,
    technology_id bigint NOT NULL,
    FOREIGN KEY (feedbacker_id)    REFERENCES users (id),
    FOREIGN KEY (technology_id)   REFERENCES technologies (id),
    UNIQUE(technology_id, feedbacker_id)
);

ALTER TABLE attributes ADD COLUMN possible_values text;