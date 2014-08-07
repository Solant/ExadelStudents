ALTER TABLE Attributes ADD COLUMN pattern varchar(40);
ALTER TABLE Attributes ALTER COLUMN attrName TYPE varchar(60);
ALTER TABLE Attributes ADD COLUMN error_message varchar(100);