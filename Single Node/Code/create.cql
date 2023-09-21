//CQL Question 2 Project Big Data

DROP KEYSPACE IF EXISTS recipe;
CREATE KEYSPACE recipe 
WITH replication = {'class': 'SimpleStrategy', 'replication_factor' : 1};

CREATE TABLE recipe.recipes_by_month_submitted (
	month_submitted text,
	score float,
	id int,
	name text,
	PRIMARY KEY ((month_submitted), score, id)
) WITH CLUSTERING ORDER BY (score DESC, id ASC); 

CREATE TABLE recipe.recipes_by_difficulty (
	difficulty text,
	score float,
	id int,
	name text,
	PRIMARY KEY (difficulty, score, id)
) WITH CLUSTERING ORDER BY (score DESC, id ASC);

CREATE TABLE recipe.recipes(
	name text,
	id int,
	minutes int,
	contributor_id int,
	score float,
	date_submitted date,
	tags set<text>,
	nutrition list<float>,
	steps list<text>,
	number_of_steps smallint,
	description text,
	ingredients set<text>,
	number_of_ingredients smallint,
	difficulty text,
	PRIMARY KEY ((name), id)
) WITH CLUSTERING ORDER BY (id ASC);

CREATE TABLE recipe.recipes_by_tag (
	tag text,
	date_submitted date,
	id int,
	score float,
	name text,
	PRIMARY KEY ((tag), date_submitted, id)
) WITH CLUSTERING ORDER BY (date_submitted DESC, id ASC);

CREATE MATERIALIZED VIEW recipe.recipes_by_tag_by_score AS
SELECT * FROM recipe.recipes_by_tag
WHERE tag IS NOT NULL AND date_submitted IS NOT NULL AND score IS NOT NULL AND id IS NOT NULL AND name IS NOT NULL
PRIMARY KEY ((tag), score, date_submitted, id);
