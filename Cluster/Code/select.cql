//Question 1
PAGING OFF;
SELECT name, month_submitted, score
FROM recipe.recipes_by_month_submitted 
WHERE month_submitted IN  ('2012-01', '2012-02', '2012-03', '2012-04', '2012-05')
ORDER BY score DESC
LIMIT 30;
PAGING ON;

//Question 2
SELECT name, difficulty, nutrition, steps, description, score  
FROM recipe.recipes
WHERE name = 'chic greek salad'
LIMIT 1;

//Question 3
SELECT name, difficulty, score FROM recipe.recipes_by_difficulty
WHERE difficulty='easy';

//Question 4
SELECT name, tag, date_submitted
FROM recipe.recipes_by_tag
WHERE tag = 'crock-pot-slow-cooker'
ORDER BY date_submitted;

//Question 5
SELECT name, tag, score
FROM recipe.recipes_by_tag_by_score
WHERE tag = 'cocktails'
LIMIT 20;
