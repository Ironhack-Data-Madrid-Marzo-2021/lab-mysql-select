SELECT  
authors.au_id as 'AUTOR ID',
authors.au_lname as 'LAST NAME',
authors.au_fname as 'FIRST NAME',
IFNULL(SUM(sales.qty), 0) AS 'TITLE_COUNT'

FROM 
authors 
LEFT JOIN titleauthor
ON titleauthor.au_id = authors.au_id
LEFT JOIN titles 
ON titles.title_id= titleauthor.title_id
LEFT JOIN sales 
ON sales.title_id=titles.title_id
GROUP BY authors.au_id,authors.au_lname,authors.au_fname
ORDER BY TITLE_COUNT DESC
LIMIT 23;