//Q1
PAGING OFF;
SELECT name, month_submitted, score
FROM recipe.recipes_by_month_submitted 
WHERE month_submitted IN  ('2012-01', '2012-02', '2012-03', '2012-04', '2012-05')
ORDER BY score DESC
LIMIT 30;
PAGING ON;

//Q2
SELECT name, difficulty, nutrition, steps, description, score  
FROM recipe.recipes
WHERE name = 'chic greek salad'
LIMIT 1;

//Q3
SELECT name, difficulty, score FROM recipe.recipes_by_difficulty
WHERE difficulty='easy';

//Q4
SELECT name, tags, date_submitted
FROM recipe.recipes_by_tags
WHERE tags CONTAINS 'crock-pot-slow-cooker'
ALLOW FILTERING;

//Q5
SELECT name, score
FROM recipe.recipes_by_tags_by_score
WHERE tags CONTAINS 'cocktail'
LIMIT 20
ALLOW FILTERING;
