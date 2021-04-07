select pub_name, title, title_id
from publishers
left join titles 
on publishers.pub_id = titles.pub_id;


select au_lname, au_fname, title_id, authors.au_id as authorid
from authors 
inner join titleauthor
on authors.au_id = titleauthor.au_id;

SELECT a.au_id as 'Author ID', au_lname as 'Last Name', au_fname as 'First Name',
pub_name AS 'Publisher', COUNT(t.title_id) AS 'Title Count'
FROM authors AS a
Join titleauthor AS ta
on a.au_id = ta.au_id
JOIN titles AS t
on t.title_id = ta.title_id
JOIN publishers as p
ON t.pub_id = p.pub_id
GROUP BY p.pub_id, a.au_id;


SELECT a.au_id AS 'Author Id', au_lname AS 'Last Name', au_fname AS 'First Name', SUM(s.qty) AS 'TOTAL_SALES'
FROM sales AS s
JOIN titles AS t
on s.title_id = t.title_id
JOIN titleauthor as ta
on ta.title_id = t.title_id
JOIN authors as a
on a.au_id = ta.au_id
group by a.au_id, a.au_fname, a.au_lname
ORDER BY SUM(qty) DESC
LIMIT 3;


SELECT a.au_id AS 'Author Id', au_lname AS 'Last Name', au_fname AS 'First Name', ifnull(SUM(s.qty),0) AS 'TOTAL_SALES'
FROM sales AS s
JOIN titles AS t
on s.title_id = t.title_id
JOIN titleauthor as ta
on ta.title_id = t.title_id
JOIN authors as a
on a.au_id = ta.au_id
group by a.au_id, a.au_fname, a.au_lname
ORDER BY ifnull(SUM(qty), 0) DESC
LIMIT 23
; 