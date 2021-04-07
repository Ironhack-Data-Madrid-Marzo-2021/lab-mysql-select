# Challenge 1 - Who Have Published What At Where?

SELECT a.au_id AS AUTHOR_ID , a.au_lname AS LAST_NAME, a.au_fname AS FIRST_NAME, t.title AS TITLE, p.pub_name AS PUBLISHER
FROM titles AS t 
	INNER JOIN publishers AS p ON t.pub_id = p.pub_id 
	INNER JOIN titleauthor AS ta ON ta.title_id = t.title_id
	INNER JOIN authors AS a ON a.au_id = ta.au_id;
    
# Challenge 2 - Who Have Published How Many At Where?

SELECT ta.au_id AS AUTHOR_ID, a.au_lname AS LAST_NAME, a.au_fname AS FIRST_NAME, p.pub_name AS PUBLISHER, COUNT(t.title) AS TITLE_COUNT
FROM titles AS t
	INNER JOIN publishers AS p ON t.pub_id = p.pub_id
    INNER JOIN titleauthor AS ta ON ta.title_id = t.title_id
	INNER JOIN authors AS a ON a.au_id = ta.au_id
GROUP BY a.au_id, p.pub_name
ORDER BY TITLE_COUNT DESC;

# Challenge 3 - Best Selling Authors

SELECT a.au_id AS AUTHOR_ID , a.au_lname AS LAST_NAME, a.au_fname AS FIRST_NAME, SUM(s.qty) AS TOTAL
FROM authors AS a
	LEFT JOIN titleauthor AS ta ON a.au_id = ta.au_id
	LEFT JOIN titles AS t ON ta.title_id = t.title_id
    LEFT JOIN sales AS s ON t.title_id = s.title_id
GROUP BY a.au_id
ORDER BY TOTAL DESC
LIMIT 3;

# Challenge 4 - Best Selling Authors Ranking

SELECT a.au_id AS AUTHOR_ID , a.au_lname AS LAST_NAME, a.au_fname AS FIRST_NAME, SUM(ifnull(s.qty, 0)) AS TOTAL
FROM authors AS a
	LEFT JOIN titleauthor AS ta ON a.au_id = ta.au_id
	LEFT JOIN titles AS t ON ta.title_id = t.title_id
    LEFT JOIN sales AS s ON t.title_id = s.title_id
GROUP BY a.au_id
ORDER BY TOTAL DESC;

# Bonus Challenge - Most Profiting Authors

SELECT ta.au_id AS AUTHOR_ID, a.au_lname AS LAST_NAME, a.au_fname AS FIRST_NAME, SUM(t.title) AS PROFIT

