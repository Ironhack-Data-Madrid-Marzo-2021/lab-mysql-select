USE publications;

SELECT authors.au_id as AUTHOR_ID, au_lname as LAST_NAME, au_fname as FIRST_NAME,titles.title as TITLE, publishers.pub_name as PUBLISHER
FROM authors
INNER JOIN titleauthor
ON titleauthor.au_id=authors.au_id
INNER JOIN titles
ON titles.title_id=titleauthor.title_id
INNER JOIN publishers
ON publishers.pub_id=titles.pub_id;


SELECT authors.au_id as AUTHOR_ID, au_lname as LAST_NAME, au_fname as FIRST_NAME,titles.title as TITLE, publishers.pub_name as PUBLISHER, COUNT(titles.title) AS COUNT_TITLE
FROM authors
INNER JOIN titleauthor
ON titleauthor.au_id=authors.au_id
INNER JOIN titles
ON titles.title_id=titleauthor.title_id
INNER JOIN publishers
ON publishers.pub_id=titles.pub_id
GROUP BY authors.au_id, publisher.pub_name;



SELECT authors.au_id as AUTHOR_ID, au_lname as LAST_NAME, au_fname as FIRST_NAME, SUM(ifnull(qty,0)) as TOTAL
FROM authors
LEFT JOIN titleauthor
ON titleauthor.au_id=authors.au_id
LEFT JOIN titles
ON titles.title_id=titleauthor.title_id
LEFT JOIN sales
ON sales.title_id=titles.title_id
GROUP BY authors.au_id
ORDER BY SUM(ifnull(qty,0)) DESC
LIMIT 23;


