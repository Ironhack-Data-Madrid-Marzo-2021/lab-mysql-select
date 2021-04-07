SELECT  
authors.au_id as 'AUTOR ID',
authors.au_lname as 'LAST NAME',
authors.au_fname as 'FIRST NAME',
SUM(sales.qty) AS 'TITLE COUNT'

FROM 
authors 
INNER JOIN titleauthor
ON titleauthor.au_id = authors.au_id
INNER JOIN titles 
ON titles.title_id= titleauthor.title_id
INNER JOIN sales 
ON sales.title_id=titles.title_id
GROUP BY authors.au_id,authors.au_lname,authors.au_fname
ORDER BY 'TITLE COUNT' DESC
LIMIT 3;