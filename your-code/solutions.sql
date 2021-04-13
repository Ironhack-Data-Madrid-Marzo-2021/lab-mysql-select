#CHALLENGE 1

SELECT authors.au_id as AUTHOR_ID, authors.au_lname as LAST_NAME, authors.au_fname as FIRST_NAME, titles.title as TITLE, publishers.pub_name as PUBLISHER
FROM authors
INNER JOIN titleauthor
ON titleauthor.au_id=authors.au_id
INNER JOIN titles
ON titles.title_id=titleauthor.title_id
INNER JOIN publishers
ON titles.pub_id=publishers.pub_id;

#CHALLENGE 2

SELECT authors.au_id AS AUTHOR_ID, authors.au_lname AS LAST_NAME, authors.au_fname AS FIRST_NAME, publishers.pub_name AS PUBLISHER, COUNT(titles.title_id) AS count_titles
FROM authors
INNER JOIN titleauthor
ON titleauthor.au_id=authors.au_id
INNER JOIN titles
ON titles.title_id=titleauthor.title_id
INNER JOIN publishers
ON publishers.pub_id=titles.pub_id
GROUP BY authors.au_id,publishers.pub_id;

#CHALLENGE 3
SELECT authors.au_id AS AUTHOR_ID, authors.au_lname AS LAST_NAME, authors.au_fname AS FIRST_NAME, sum(sales.qty) AS TOTAL_SALES
FROM authors
INNER JOIN titleauthor
ON titleauthor.au_id=authors.au_id
INNER JOIN titles
ON titles.title_id=titleauthor.title_id
INNER JOIN sales
ON titles.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY TOTAL_sALES DESC
LIMIT 3;

#CHALLENGE 4
 
SELECT authors.au_id AS AUTHOR_ID, au_lname AS LAST_NAME, au_fname AS FIRST_NAME, sum(sales.qty) AS TOTAL
FROM authors
LEFT JOIN titleauthor
ON authors.au_id = titleauthor.au_id
LEFT JOIN titles
ON titleauthor.title_id = titles.title_id
LEFT JOIN sales
ON titles.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC
LIMIT 23;
 
