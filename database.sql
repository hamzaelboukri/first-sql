CREATE DATABASE movier;

-- swbt tabl lwl 
CREATE TABLE user_ (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Date DATE NOT NULL,
    SubscriptionID INT,
);

 -- table 2
 CREATE TABLE subscription (
    SubscriptionID INT AUTO_INCREMENT PRIMARY KEY,
    SubscriptionType VARCHAR(50) NOT NULL,
    MonthlyFee decimal(10,2) NOT NULL
);
-- table 3
CREATE TABLE movie (
    MovieID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Genre VARCHAR(100) NOT NULL,
    ReleaseYear INT,
    Duration INT,
    Rating VARCHAR(10)
);
-- table 4
CREATE TABLE review (
    ReviewID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT NOT NULL,
    MovieID INT NOT NULL,
    Rating INT CHECK (Rating BETWEEN 0 AND 5),
    ReviewText TEXT,
    ReviewDate DATE NULL,
    FOREIGN KEY (MovieID) REFERENCES movie(MovieID)
);
-- TABLE 5

CREATE TABLE watchhistory (
    WatchHistoryID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT NOT NULL,
    MovieID INT NOT NULL,
    WatchDate DATE,
    CompletionPercentage INT ,
    FOREIGN KEY (MovieID) REFERENCES movie(MovieID)
);

-- ajouter constrent foregin key 
ALTER TABLE user_
ADD CONSTRAINT FK_  FOREIGN KEY (SubscriptionID) REFERENCES subscription(SubscriptionID)

-- ajouter constrent foregin key 
ALTER TABLE review
ADD CONSTRAINT FK_1 FOREIGN KEY (UserID) REFERENCES user(UserID)

-- ajouter constrent foregin key 
ALTER TABLE watchhistory
ADD CONSTRAINT FK_2 FOREIGN KEY (UserID) REFERENCES user(UserID)

-- MODIFER subscription
ALTER TABLE subscription
MODIFY COLUMN SubscriptionType ENUM('BASIC', 'PREMIUM') NOT NULL;

--Insérer un film : Ajouter un nouveau film intitulé Data Science Adventures dans le genre "Documentary".
   
INSERT INTO movie (
    Title,
    Genre,
    ReleaseYear,
    Duration,
    Rating
)
VALUES ('
       Data Science Adventures ',
        'Docmmentary',
        2024,
        120,
        'PG')

-- inner join 


SELECT user_.FirstName,subscription.SubscriptionType 
FROM user_ INNER JOIN subscription ON user_.SubscriptionID=subscription.SubscriptionID;

-- modifer
ALTER TABLE watchhistory
MODIFY completionpercentage INT CHECK (completionpercentage BETWEEN 0 AND 100);
 -- modifer
ALTER TABLE user_
MODIFY COLUMN subscriptionid int null;
-- Rechercher des films : Lister tous les films du genre "Comedy" sortis après 2020

SELECT * 
FROM movie 
WHERE genre= 'Comedy'AND releaseyear > 2020
     
-- update



     UPDATE subscription 
SET subscriptiontype = 'Premium', monthlyfee = 11.99
WHERE subscriptiontype= 'basic';







-- Afficher les abonnements : Joindre les utilisateurs à leurs types d'abonnements.

SELECT u.FirstName, u.LastName, s.SubscriptionType, s.MonthlyFee
FROM User_ u
INNER JOIN Subscription s ON u.SubscriptionID = s.SubscriptionID;



--Filtrer les visionnages : Trouver tous les utilisateurs ayant terminé de regarder un film.

SELECT u.FirstName, u.LastName, w.MovieID ,w.CompletionPercentage
FROM WatchHistory w
 inner JOIN User_ u ON w.UserID = u.UserID
WHERE w.CompletionPercentage = 100;


--Trier et limiter : Afficher les 5 films les plus longs, triés par durée.

SELECT Title,Duration
FROM Movie 
ORDER BY `Movie`.`Duration` DESC LIMIT 5

--Agrégation : Calculer le pourcentage moyen de complétion pour chaque film.

SELECT m.movieID, m.title, AVG(w.CompletionPercentage) AS Completi
FROM WatchHistory w
JOIN movie m ON w.movieID = m.movieID
GROUP BY w.movieID, m.title;


--Group By : Grouper les utilisateurs par type d’abonnement et compter le nombre total d’utilisateurs par groupe.

SELECT s.SubscriptionType, COUNT(u.UserID) 
FROM Subscription s
JOIN user_ u ON s.SubscriptionID = u.SubscriptionID
GROUP BY s.SubscriptionType;

--Sous-requête (Bonus): Trouver les films ayant une note moyenne supérieure à 4.

SELECT m.Title, AVG(r.Rating) 
FROM Movie m
JOIN Review r ON m.MovieID = r.MovieID
GROUP BY m.MovieID, m.Title
HAVING AVG(r.Rating) < 4;

