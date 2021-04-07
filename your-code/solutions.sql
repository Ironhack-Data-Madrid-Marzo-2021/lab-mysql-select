USE publications


#####################################                      CHALLENGE 01               #####################################################

# Queremos sacar un lista que muestre au_id   au_fname  au_lname   title    pub_name
# Necesitamos que la relación sea Autor ----> titulo ------> Editorial


SELECT authors.au_id AS 'Autor ID', authors.au_fname AS 'Nombre autor', authors.au_lname AS 'Apellido autor', titles.title AS 'Título',
publishers.pub_name AS 'Editor'
FROM authors
INNER JOIN titleauthor
ON titleauthor.au_id = authors.au_id
INNER JOIN titles
ON titles.title_id = titleauthor.title_id
INNER JOIN publishers
ON titles.pub_id = publishers.pub_id;

###########################################################################################################################################






#########################################                   CHALLENGE 02               #####################################################

# Queremos sacar un lista que muestre au_id   au_fname  au_lname     pub_name     numero de títulos
# Necesitamos que la relación sea Autor ----> Editorial      numero de titulos


SELECT
authors.au_id AS 'Autor ID',
authors.au_fname AS 'Nombre autor',
authors.au_lname AS 'Apellido autor',
publishers.pub_name AS 'Editor',
COUNT(titles.title_id) as 'Nº Títulos'
FROM authors
INNER JOIN titleauthor
ON titleauthor.au_id = authors.au_id
INNER JOIN titles
ON titles.title_id = titleauthor.title_id
INNER JOIN publishers
ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id, publishers.pub_id;

###########################################################################################################################################



############################################               CHALLENGE 03               #####################################################

SELECT 
authors.au_id AS 'Autor ID',
authors.au_fname AS 'Nombre autor',
authors.au_lname AS 'Apellido autor',
SUM(sales.qty) AS cantidad

FROM authors
INNER JOIN titleauthor
ON titleauthor.au_id = authors.au_id
INNER JOIN titles
ON titles.title_id = titleauthor.title_id
INNER JOIN sales
ON sales.title_id = titles.title_id
GROUP BY authors.au_id
ORDER BY cantidad DESC
LIMIT 3;



###########################################################################################################################################



############################################               CHALLENGE 04               #####################################################



SELECT 
authors.au_id AS 'Autor ID',
authors.au_fname AS 'Nombre autor',
authors.au_lname AS 'Apellido autor',
SUM(sales.qty) AS cantidad

FROM authors
INNER JOIN titleauthor
ON titleauthor.au_id = authors.au_id
INNER JOIN titles
ON titles.title_id = titleauthor.title_id
INNER JOIN sales
ON sales.title_id = titles.title_id
GROUP BY authors.au_id
ORDER BY cantidad ASC
LIMIT 23;


###########################################################################################################################################



###############################################               BONUS CHALLENGE               ###############################################


SELECT
authors.au_id as 'Autor ID',
CONCAT(authors.au_lname,' ', authors.au_fname) AS 'Escritor',
((roysched.royalty * titleauthor.royaltyper) + advance) AS TOTAL

FROM authors

INNER JOIN titleauthor
ON titleauthor.au_id = authors.au_id

INNER JOIN titles
ON titles.title_id = titleauthor.title_id

INNER JOIN roysched
ON roysched.title_id = titles.title_id

GROUP BY authors.au_id

ORDER BY TOTAL DESC;

LIMIT 3;






SELECT
authors.au_id as 'Autor ID',
CONCAT(authors.au_lname,' ', authors.au_fname) AS 'Escritor',
((titles.royalty * titleauthor.royaltyper) + advance) AS TOTAL

FROM authors

INNER JOIN titleauthor
ON titleauthor.au_id = authors.au_id

INNER JOIN titles
ON titles.title_id = titleauthor.title_id

GROUP BY authors.au_id

ORDER BY TOTAL DESC

LIMIT 3;





