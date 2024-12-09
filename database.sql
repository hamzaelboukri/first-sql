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


   
