//CQL Question 2 Project Big Data

DROP KEYSPACE IF EXISTS recipe;
CREATE KEYSPACE recipe 
WITH replication = {'class': 'SimpleStrategy', 'replication_factor' : 1};

CREATE TABLE recipe.recipes_by_date_submitted (
	date_submitted date,
	score float,
	id int,
	name text,
	PRIMARY KEY ((date_submitted), score, id)
) WITH comment = 'Q1. Show popular recipes within a three months period'
AND CLUSTERING ORDER BY (score DESC, id ASC); 

//'Q2. Search recipes by title/name'
CREATE MATERIALIZED VIEW recipe.recipes_by_name AS
SELECT * FROM recipe.recipes_by_date_submitted
WHERE name IS NOT NULL AND score IS NOT NULL AND id IS NOT NULL AND date_submitted IS NOT NULL
PRIMARY KEY ((name), score, id, date_submitted);

CREATE TABLE recipe.recipes_by_difficulty (
	difficulty text,
	score float,
	id int,
	name text,
	date_submitted date,
	PRIMARY KEY (difficulty, score, id)
) WITH comment = 'Q3. Search recipes by difficulty'
AND CLUSTERING ORDER BY (score DESC, id ASC);

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
) WITH comment = 'Q4. View Recipe Details'
AND CLUSTERING ORDER BY (id ASC);

CREATE TABLE recipe.recipes_by_tag (
	tags frozen<set<text>>,
	date_submitted date,
	score float,
	id int,
	name text,
	minutes int,
	PRIMARY KEY ((tags), date_submitted, score, id)
) WITH comment = 'Q5. View the top-n recipes related to a specific tag'
AND CLUSTERING ORDER BY (date_submitted DESC, score DESC, id ASC);
