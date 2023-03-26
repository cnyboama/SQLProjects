-- Famous People Project
CREATE TABLE famous_people (
		id INTEGER PRIMARY KEY AUTO_INCREMENT,
		fullName VARCHAR (50),
		age INTEGER,
		nationality TEXT,
		field TEXT);
        
INSERT INTO famous_people (fullname, age, nationality, field) VALUES ("Tom Cruise", 60, "US", "Actor");
INSERT INTO famous_people (fullname, age, nationality, field) VALUES ("Mark Zucherberg", 33, "US", "Business");
INSERT INTO famous_people (fullname, age, nationality, field) VALUES ("Chris Hemsworth", 38, "Australia", "Actor");
INSERT INTO famous_people (fullname, age, nationality, field) VALUES ("Will Smith", 53, "US" , "Actor");
INSERT INTO famous_people (fullname, age, nationality, field) VALUES ("Jeff Bezos", 54, "US", "Business");
INSERT INTO famous_people (fullname, age, nationality, field) VALUES ("Bill Gates", 62, "US", "Business");
INSERT INTO famous_people (fullname, age, nationality, field) VALUES ("Anne hathaway", 39, "US", "Actor");
INSERT INTO famous_people (fullname, age, nationality, field) VALUES ("Warren Buffet", 87, "US", "Business");
INSERT INTO famous_people (fullname, age, nationality, field) VALUES ("Bernard Arnault", 69, "France", "Business");
INSERT INTO famous_people (fullname, age, nationality, field) VALUES ("Jennifer Lopez", 53, "US", "Actor");        
INSERT INTO famous_people (fullname, age, nationality, field) VALUES ("J.K Rowling", 57, "UK", "Author");
INSERT INTO famous_people (fullname, age, nationality, field) VALUES ("Elon Musk", 51, "South Africa", "Business");  
INSERT INTO famous_people (fullname, age, nationality, field) VALUES ("Eminem", 50, "US", "Musician");  
INSERT INTO famous_people (fullname, age, nationality, field) VALUES ("Taylor Swift", 33, "US", "Musician");    
INSERT INTO famous_people (fullname, age, nationality, field) VALUES ("Elton John", 75, "UK", "Musician");    
INSERT INTO famous_people (fullname, age, nationality, field) VALUES ("Beyonce", 41, "US", "Musician");    
INSERT INTO famous_people (fullname, age, nationality, field) VALUES ("Dolly Parton", 77, "US", "Musician");    

CREATE table Movies  (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    famous_people_id INTEGER,
    movie TEXT,
    year TEXT);
    
INSERT INTO Movies (famous_people_id, movie, year) VALUES (1, "mission impossible", "1996");
INSERT INTO Movies (famous_people_id, movie, year) VALUES (3, "Thor", "2011");
INSERT INTO Movies (famous_people_id, movie, year) VALUES (4, "Focus", "2015");
INSERT INTO Movies (famous_people_id, movie, year) VALUES (7, "Maid in Manhattan", "2002");
INSERT INTO Movies (famous_people_id, movie, year) VALUES (10, "bride wars", "2009"); 

SELECT * FROM movies;

CREATE table wealth (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    famous_people_id INTEGER,
    net_worth TEXT,
    source_wealth TEXT);
    
INSERT INTO wealth (famous_people_id, net_worth, source_wealth) VALUES (5, "112 billion", "Amazon");
INSERT INTO wealth (famous_people_id, net_worth, source_wealth) VALUES (6, "90 billion", "Microsoft");
INSERT INTO wealth (famous_people_id, net_worth, source_wealth) VALUES (8, "84 billion", "Berkshire Hathaway");
INSERT INTO wealth (famous_people_id, net_worth, source_wealth) VALUES (9, "72 billion", "LVMH");
INSERT INTO wealth (famous_people_id, net_worth, source_wealth) VALUES (2, "71 billion", "Facebook");
   
CREATE table music (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    famous_people_id INTEGER,
    genre TEXT,
    most_popular_song TEXT,
    released_year TEXT);
    
INSERT INTO music (famous_people_id, genre, most_popular_song, released_year) 
VALUES (13, "Rap", "Not Afraid", "2010"),
	   (14, "Pop", "Shake It Off", "2014"),
       (15, "Pop", "Candle in the Wind", "1973"),
	   (16, "Pop", "Break My Soul", "2022"),
	   (17, "Country", "Jolene", "1974");
        


-- Querying our tables
SELECT * FROM famous_people;
SELECT * FROM movies;
SELECT * FROM wealth;
SELECT * FROM music;

-- Return actors and the movies they acted and the year it was released --
SELECT famous_people.fullname, movies.movie, movies.year
FROM famous_people
JOIN movies
ON famous_people.id = movies.famous_people_id;

-- Showing famous musicians and their most popular song
SELECT famous_people.fullname, music.genre, music.most_popular_song
FROM famous_people
JOIN music
ON famous_people.id = music.famous_people_id;

-- Show famous people with their net worth --
SELECT famous_people.fullname, wealth.net_worth
FROM famous_people
JOIN wealth
ON famous_people.id = wealth.famous_people_id;


