//Q1
SELECT name, date_submitted, score
FROM recipe.recipes_by_date_submitted 
WHERE date_submitted >= '2012-01-01' AND date_submitted <= '2012-05-31'  
ORDER BY score DESC
LIMIT 30;

//Q2
SELECT name, difficulty, nutrition, steps, description, score  
FROM recipe.recipes
WHERE name = 'chic greek salad'
LIMIT 1;

//Q3
SELECT name, difficulty, score FROM recipe.recipes_by_difficulty
WHERE difficulty='easy'
ORDER BY score DESC;

//Q4
SELECT name, tags, date_submitted
FROM recipe.recipes_by_tag
WHERE tags CONTAINS 'crock-pot-slow-cooker'
ALLOW FILTERING;

//Q5
SELECT name, score
FROM recipe.recipes_by_tag
WHERE tags CONTAINS 'cocktail'
ORDER BY score DESC
LIMIT 20;
