SELECT authors.au_id AS "AUTHOR ID", authors.au_lname AS "LAST NAME", authors.au_fname AS "FIRST NAME", titles.title AS "TITLE", publishers.pub_name AS "PUBLISHER" 
FROM authors 
INNER JOIN titleauthor
ON titleauthor.au_id = authors.au_id
INNER JOIN titles
ON titles.title_id = titleauthor.title_id
INNER JOIN publishers
ON titles.pub_id = publishers.pub_id
ORDER BY authors.au_id ASC;

# Challenge 2
SELECT authors.au_id AS "AUTHOR ID", 
authors.au_lname AS "LAST NAME", 
authors.au_fname AS "FIRST NAME", 
publishers.pub_name AS "PUBLISHER", 
COUNT(titles.title_id) AS "TITLE COUNT" 
FROM authors 
INNER JOIN titleauthor
ON titleauthor.au_id = authors.au_id
INNER JOIN titles
ON titles.title_id = titleauthor.title_id
INNER JOIN publishers
ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id, publishers.pub_id 
ORDER BY COUNT(titles.title_id) DESC, authors.au_id DESC; 

# Challenge 3
SELECT authors.au_id AS 'AUTHOR ID',
authors.au_lname AS 'LAST NAME', 
authors.au_fname AS 'FIRST NAME',
SUM(sales.qty) AS 'TOTAL'
FROM authors 
INNER JOIN titleauthor
ON titleauthor.au_id = authors.au_id
LEFT JOIN titles
ON titles.title_id = titleauthor.title_id
RIGHT JOIN sales
ON sales.title_id = titles.title_id
GROUP BY authors.au_id 
ORDER BY 'TOTAL'
LIMIT 3;

#Challenge 4
SELECT authors.au_id AS 'AUTHOR ID',
authors.au_lname AS 'LAST NAME', 
authors.au_fname AS 'FIRST NAME',
IFNULL(SUM(qty),0) AS 'TOTAL'
FROM authors 
INNER JOIN titleauthor
ON titleauthor.au_id = authors.au_id
LEFT JOIN titles
ON titles.title_id = titleauthor.title_id
RIGHT JOIN sales
ON sales.title_id = titles.title_id
GROUP BY authors.au_id 
LIMIT 23;
