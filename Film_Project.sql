CREATE DATABASE films;
USE films;
--------------------------------Create a table with the actors info--------------------------------------

CREATE TABLE Actor (
Actor_id INT NOT NULL,
First_name VARCHAR(50) NOT NULL,
Last_name VARCHAR(50) NOT NULL,
Gender VARCHAR(50) NOT NULL,
Nationality VARCHAR(50) NULL,
CONSTRAINT  pk_Actor_id PRIMARY KEY(Actor_id)
);


------------------------------------create a table with the Diretors info--------------------------------

CREATE TABLE Director (
Director_id INT NOT NULL,
First_name VARCHAR(50) NOT NULL,
Last_name VARCHAR(50) NOT NULL,
Gender VARCHAR(50) NOT NULL,
Nationality VARCHAR(50) NULL,
CONSTRAINT pk_Director_id PRIMARY KEY (Director_ID)
);

---------------------------------------Create a table for Movies info------------------------------------

CREATE TABLE Movie(
Movie_id INT NOT NULL,
Title VARCHAR(250) NOT NULL,
Year INT NOT NULL,
Subject VARCHAR(50) NULL,
Lenght INT NOT NULL,
Country VARCHAR(250) NULL,
Language VARCHAR(250) NULL,
CONSTRAINT pk_Movie_Id PRIMARY KEY (Movie_id)
);

----------------------------------Create a table for the Movie Genre-------------------------------------

CREATE TABLE Genre(
Genre_id INT NOT NULL,
Genre_name VARCHAR(50) NULL,
CONSTRAINT pk_Genre_id PRIMARY KEY(Genre_id)
);

------------------------------Create a table for the language-------------------------------------------

CREATE TABLE Language_table(
Language_Id INT NOT NULL,
Language VARCHAR(250) NULL,
CONSTRAINT pk_language_id PRIMARY KEY(Language_id)
);

-----------------------------------------Create a table for the cast--------------------------------------

CREATE TABLE Movie_Cast(
Actor_id INT NOT NULL,
Director_Id INT NOT NULL,
Movie_id INT NOT NULL);

-----------------------------------------Create a table for Awards------------------------------

CREATE TABLE Award(
Award_id INT NOT NULL,
Award_won BOOLEAN NULL,
Movie_id INT NOT NULL,
CONSTRAINT pk_Award_Id PRIMARY KEY (Award_Id)
);

--------------------------------Create a table for a Movie Direction-------------------------------------

CREATE TABLE Movie_Direction(
Director_Id INT NOT NULL,
Movie_Id INT NOT NULL);

-------------------------------- We are going to fill in to our tables-------------------------------

INSERT INTO Actor
(Actor_id, First_name, Last_name, Gender, Nationality)
VALUES
(11, "Kristina", "Adolphson", "Female", "Swedish"),
(12, "Ugo", "Tognazzi", "Male", "Italian"),
(13, "Jean-Louis", "Trintignant", "Male", "French"),
(14, "Jean-Louis", "Trintignant", "Male", "French" ),
(15, "Jean-Louis", "Trintignant", "Male", "French"),
(16, "Norma", "Alejandro", "Female", "Argentinian"),
(17, "Anthony", "Hopkins", "Male", "American"),
(18, "John", "Longden", "Male", "American" ),
(19, "John", "Wayne", "Male", "American"),
(20, "Jeff", "Bridges", "Male", "American");

INSERT INTO Director 
(Director_id, First_name, Last_name, Gender, Nationality)
VALUES
(11, "Ingmar", "Bergman", "Male", "Swedish"),
(12, "Bernardo", "Bertolucci", "Male", "Italian"),
(13, "Claude", "Lelouch", "Male", "French"),
(14, "Claude", "Lelouch", "Male", "French"),
(15, "Claude", "Lelouch", "Male", "French"),
(16, "Luis", "Puenzo", "Male", "Argentinian"),
(17, "Alfred", "Hitchcock", "Male", "English"),
(18, "Buzz", "KuliK", "Male", "American"),
(19, "Woody", "Allen", "Male", "American"),
(20, " Francis", "Ford Coppola", "Male", "American");


INSERT INTO Movie
(Movie_id, Title, Year, Subject, Lenght,Country, Language)
VALUES
(11, "Fanny and Alexander", 1982, "Drama", 188, "Sweden", "Swedish" ),
(12, "Tragedy of a Ridiculous Man", 1982, "Drama", 117, "Italy", "Italian"),
(13, "A Man & a Woman", 1966, "Drama", 103, "France", "French"),
(14, "A Man & a Woman, Twenty years later", 1986, "Drama", 112, "France", "French"),
(15, "Un Hombre y una Mujer", 1966, "Drama", 103, "France", "Spanish"),
(16, "Official Story", 1985, "Drama", 112, "Argentina", "Spanish"),		
(17, "Lindbergh Kidnapping Case", 1976, "Drama", 150, "USA", "English"),
(18, "Blackmail", 1929,	"Mistery", 84, "USA", "English"),
(19, "Donovan's Reef", 1963, "Comedy", 109, "USA", "English"),
(20,"Tucker: The Man & His Dream",  1988, "Drama", 110, "USA", "English");

INSERT INTO Genre
(Genre_id, genre_name)
VALUES
(11, "Drama"),
(12, "Drama"),
(13, "Drama"),
(14, "Drama"),
(15, "Drama"),
(16, "Drama"),
(17, "Drama"),
(18," Mistery"),
(19, "Comedy"),
(20, "Drama");


INSERT INTO Language_table
(Language_Id, Language)
VALUES
(11,  "Swedish"),
(12, "Italian"),
(13, "French"),
(14, "French"),
(15, "Spanish"),
(16, "Spanish"),
(17, "English"),
(18,"English"),
(19,"English"),
(20, "English");

INSERT INTO movie_cast
(Actor_id, Director_Id, Movie_id)
VALUES
(11, 11, 11),
(12, 12, 12),
(13, 13, 13),
(14, 14, 14),
(15, 15, 15),
(16, 16, 16),
(17, 17, 17),
(18, 18, 18),
(19, 19, 19),
(20, 20, 20);

INSERT INTO award         
(Award_id, Award_won, Movie_Id)
VALUES
(11, True, 11 ),
(12, False, 12),
(13, True, 13),
(14, False, 14),
(15, True, 15),
(16, False, 16),
(17, False, 17),
(18, False, 18),
(19, False, 19),
(20, False, 20);

INSERT INTO movie_direction
(Director_Id, Movie_Id)
VALUES
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19,19),
(20, 20);

-------------------------------------------------Foreign keys-----------------------------------------------------

###we are adding foreign key constraints to the Movie_cast, Award, and Movie_direction tables. 
###Each foreign key constraint specifies the foreign key column and the referenced table/column that it refers to.

-- Add foreign key constraint to Movie_direction table
ALTER TABLE movie_direction
ADD CONSTRAINT FK_movie_director
FOREIGN KEY (Director_id) REFERENCES director(Director_id);

--Add foreign key constraint to Movie_cast table

ALTER TABLE movie_cast
ADD CONSTRAINT FK_MovieCast_Actor
FOREIGN KEY (Actor_id) REFERENCES actor(Actor_id),
ADD CONSTRAINT FK_MovieCast_Director
FOREIGN KEY (Director_id) REFERENCES director(Director_id),
ADD CONSTRAINT FK_MovieCast_Movie
FOREIGN KEY (Movie_id) REFERENCES movie(Movie_id);

-- Add foreign key constraint to Award table
ALTER TABLE Award
ADD CONSTRAINT FK_Award_Movie
FOREIGN KEY (Movie_id) REFERENCES movie(Movie_id);

-- Add foreign key constraint to Movie_direction table
ALTER TABLE Movie_direction
ADD CONSTRAINT FK_MovieDirection_Director
FOREIGN KEY (Director_id) REFERENCES director(Director_id),
ADD CONSTRAINT FK_MovieDirection_Movie
FOREIGN KEY (Movie_id) REFERENCES Movie(Movie_id);


------------------------------------------Create a view with any type of Joins-----------------------------------------
-- Create the view
CREATE VIEW CombinedView AS
SELECT m.Title, d.First_name AS Director_FirstName, d.Last_name AS Director_LastName,
       a.First_name AS Actor_FirstName, a.Last_name AS Actor_LastName
FROM Movie m
LEFT JOIN Movie_direction md ON m.Movie_id = md.Movie_id
LEFT JOIN Director d ON md.Director_id = d.Director_id
LEFT JOIN Movie_cast mc ON m.Movie_id = mc.Movie_id
LEFT JOIN Actor a ON mc.Actor_id = a.Actor_id;

SELECT *
FROM CombinedView;


-------------------------------------------Stored function -- number of movies released in a specific year------------------------------
DELIMITER //
CREATE FUNCTION GetMovieCountByYear(movieYear INT)
RETURNS INT
READS SQL DATA
BEGIN
    DECLARE movieCount INT;
    
    SELECT COUNT(*) INTO movieCount
    FROM Movie
    WHERE Year = movieYear;
    
    RETURN movieCount;
END //
DELIMITER ;

SELECT GetMovieCountByYear(1985);

------------------create a query with a subquery to demonstrate  how to extract data from your DB for analysis-------
#########How many films did Bertolucci did and how many award won ?

SELECT m.Title, (SELECT COUNT(*) FROM Award WHERE Movie_id = m.Movie_id) AS Award_Count
FROM Movie m
JOIN Movie_direction md ON m.Movie_id = md.Movie_id
JOIN Director d ON md.Director_id = d.Director_id
WHERE d.First_name = 'Bernardo' AND d.Last_name = 'Bertolucci';

---------------------------------------Stored Procedure---------------------------------------------------------------------
DELIMITER //
CREATE PROCEDURE GetMovieInfoByTitleFullNameY_N(IN movieTitle VARCHAR(255))
BEGIN
    SELECT m.Title, CONCAT(d.First_name, ' ', d.Last_name) AS Director,
           CONCAT(a.First_name, ' ', a.Last_name) AS Actor,
           CASE WHEN aw.Award_won = 1 THEN 'Yes' ELSE 'No' END AS Award_Won
    FROM Movie m
    JOIN Movie_direction md ON m.Movie_id = md.Movie_id
    JOIN Director d ON md.Director_id = d.Director_id
    LEFT JOIN Movie_cast mc ON m.Movie_id = mc.Movie_id
    LEFT JOIN Actor a ON mc.Actor_id = a.Actor_id
    LEFT JOIN Award aw ON m.Movie_id = aw.Movie_id
    WHERE m.Title = movieTitle;
END //
DELIMITER ;

CALL GetMovieInfoByTitle('Fanny and Alexander');


-------------create a view that uses 3-4 tables; prepare and demonstrate a query to produce a logically arranged result set for analysis
-------------------------------------------------Create the view-----------------------------------------------------------
CREATE VIEW MovieInfoView AS
SELECT m.Title, m.Year, d.First_name AS Director_FirstName, d.Last_name AS Director_LastName,
       a.First_name AS Actor_FirstName, a.Last_name AS Actor_LastName
FROM Movie m
JOIN Movie_direction md ON m.Movie_id = md.Movie_id
JOIN Director d ON md.Director_id = d.Director_id
JOIN Movie_cast mc ON m.Movie_id = mc.Movie_id
JOIN Actor a ON mc.Actor_id = a.Actor_id;

SELECT *
FROM MovieInfoView
WHERE Year >= 1975
ORDER BY Year DESC;

---------------------------------------------group by and having------------------------------------------------------------------------
SELECT Country, COUNT(*) AS FilmCount
FROM Movie
GROUP BY Country
HAVING COUNT(*) > 0
ORDER BY FilmCount DESC;

