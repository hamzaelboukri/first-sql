CREATE DATABASE movier;

-- swbt tabl lwl 
CREATE TABLE user_ (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Date DATE NOT NULL,
    SubscriptionID INT,
    FOREIGN KEY (SubscriptionID) REFERENCES subscription(SubscriptionID)
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
    FOREIGN KEY (UserID) REFERENCES user(UserID),
    FOREIGN KEY (MovieID) REFERENCES movie(MovieID)
);
-- TABLE 5

CREATE TABLE watchhistory (
    WatchHistoryID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT NOT NULL,
    MovieID INT NOT NULL,
    WatchDate DATE,
    CompletionPercentage INT CHECK (CompletionPercentage BETWEEN 0 AND 100),
    FOREIGN KEY (UserID) REFERENCES user(UserID),
    FOREIGN KEY (MovieID) REFERENCES movie(MovieID)
);