SELECT 
authors.au_id as "AUTOR ID",
authors.au_lname as "LAST NAME",
authors.au_fname as "FIRST NAME",
titles.title as "TITLE",
publishers.pub_name as "PUBLISHER"

FROM 
authors 
INNER JOIN titleauthor
ON titleauthor.au_id = authors.au_id
INNER JOIN titles 
ON titles.title_id= titleauthor.title_id
INNER JOIN publishers 
ON titles.pub_id= publishers.pub_id;