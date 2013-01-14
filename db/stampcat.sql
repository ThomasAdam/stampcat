CREATE TABLE stamps
(
	id		INTEGER PRIMARY KEY AUTOINCREMENT,
	category	VARCHAR(255),
	country		VARCHAR(255),
	catalogue_id	VARCHAR(255),
	issue_date	TEXT,
	design		VARCHAR(255),
	perforations	INTEGER,
	width		INTEGER,
	height		INTEGER,
	image		BLOB
);
