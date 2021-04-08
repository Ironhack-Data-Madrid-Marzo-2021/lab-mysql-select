# columna authors ---> el id es au_id
# columna titles ---> el id es title_id
# columna pub_info ---> 

# Exercise 1

SELECT authors.au_id, authors.au_lname, authors.au_fname,
 titles.title, publishers.pub_name
FROM publications.authors
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN  titles
ON titleauthor.title_id = titles.title_id
INNER JOIN publishers
ON titles.pub_id = publishers.pub_id;

# Exercise 2
SELECT ta.au_id AS "AUTHOR ID", a.au_lname AS "LAST NAME", a.au_fname AS "FIRST NAME", p.pub_name AS "PUBLISHER", count(t.title) AS "TITLE COUNT"
FROM titleauthor  AS ta
INNER JOIN authors AS a 
ON ta.au_id = a.au_id
INNER JOIN titles AS t 
ON ta.title_id = t.title_id
INNER JOIN publishers AS p 
ON t.pub_id = p.pub_id
GROUP BY ta.au_id, p.pub_id
ORDER BY count("TITLE COUNT") desc;

# Exercise 3

SELECT a.au_id AS "AUTHOR ID", a.au_lname AS "LAST NAME", a.au_fname AS "FIRST NAME", sum(s.qty) AS "TOTAL"
FROM authors AS a
INNER JOIN titleauthor AS ta
ON a.au_id = ta.au_id
INNER JOIN sales AS s
ON ta.title_id = s.title_id
GROUP BY a.au_id
ORDER BY sum(TOTAL) DESC
LIMIT 3;

# Exercise 4

SELECT a.au_id AS "AUTHOR ID", a.au_lname AS "LAST NAME", a.au_fname AS "FIRST NAME", coalesce(sum(qty), 0) AS "TOTAL"
FROM authors AS a
INNER JOIN titleauthor AS ti 
ON a.au_id = ti.au_id
INNER JOIN sales AS sa
ON ti.title_id = sa.title_id
GROUP BY a.au_id
ORDER BY sum(qty) DESC;





