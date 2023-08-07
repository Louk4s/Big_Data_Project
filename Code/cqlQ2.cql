//CQL Question 2 Project Big Data

DROP KEYSPACE IF EXISTS recipe;
CREATE KEYSPACE recipe 
WITH replication = {'class': 'SimpleStrategy', 'replication_factor' : 1};

CREATE TABLE recipe.recipes_by_score (
	score smallint,
	name text,
	id int,
	minutes smallint,
	date_submitted date,
	PRIMARY KEY ((score), name, id)
) WITH comment = 'Q1. Show popular recipes within a three months period'
AND CLUSTERING ORDER BY (name DESC, id ASC); 

//'Q2. Search recipes by title/name'
CREATE MATERIALIZED VIEW recipe.recipes_by_name AS
SELECT * FROM recipe.recipes_by_score
WHERE name IS NOT NULL and score IS NOT NULL and id IS NOT NULL
PRIMARY KEY (name, score, id);

CREATE TABLE recipe.recipes_by_number_of_steps (
	number_of_steps smallint,
	name text,
	score smallint,
	id int,
	minutes smallint,
	date_submitted date,
	PRIMARY KEY ((number_of_steps), name, score, id)
) WITH comment = 'Q3. Search recipes by difficulty'
AND CLUSTERING ORDER BY (name DESC, score DESC, id ASC);

CREATE TABLE recipe.recipes(
	id int,
	name text,
	minutes smallint,
	contributor_id text,
	score smallint,
	date_submitted date,
	tags set<text>,
	nutrition list<float>,
	steps list<text>,
	numbers_of_steps smallint,
	description text,
	ingredients set<text>,
	number_of_ingredients smallint,
	PRIMARY KEY ((id),name)
) WITH comment = 'Q4. View Recipe Details'
AND CLUSTERING ORDER BY (name DESC);

CREATE TABLE recipe.recipes_by_tag (
	tags frozen<set<text>>,
	name text,
	score smallint,
	id int,
	minutes smallint,
	date_submitted date,
	PRIMARY KEY ((tags), name, score, id)
) WITH comment = 'Q5. View the top-n recipes related to a specific tag'
AND CLUSTERING ORDER BY (name DESC, score DESC, id ASC);
