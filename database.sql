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

-- add movier
   
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
-- sort 

SELECT * 
FROM movie 
WHERE genre= 'Comedy'AND releaseyear > 2020
     