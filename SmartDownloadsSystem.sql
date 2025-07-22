CREATE TABLE DigitalResources (
    ResourceID INTEGER PRIMARY KEY,
    Title TEXT NOT NULL,
    Resourcetype TEXT NOT NULL,
    Author TEXT,
    PublicationYear INTEGER,
    URL TEXT,
    FORMAT TEXT,
    SizeMB REAL
);
CREATE TABLE Users (
    UserID INTEGER PRIMARY KEY,
    Name TEXT NOT NULL,
    Email TEXT UNIQUE NOT NULL,
    Membershiptype TEXT,
    JoinDate DATE
);
CREATE TABLE Downloads (
    DownloadID INTEGER PRIMARY KEY,
    UserID INTEGER,
    ResourceID INTEGER,
    DownloadDate DATE,
    FOREIGN KEY(UserID) REFERENCES Users(UserID),
    FOREIGN KEY(ResourceID) REFERENCES DigitalResources(ResourceID)
);
CREATE TABLE Tags (
    TagID INTEGER PRIMARY KEY,
    TagName TEXT NOT NULL UNIQUE
);
CREATE TABLE ResourceTag (
    ResourceID INTEGER,
    TagID INTEGER,
    PRIMARY KEY (ResourceID, TagID),
    FOREIGN KEY(ResourceID) REFERENCES DigitalResources(ResourceID),
    FOREIGN KEY(TagID) REFERENCES Tags(TagID)
);
CREATE TABLE Ratings (
    RatingID INTEGER PRIMARY KEY AUTOINCREMENT,
    UserID INTEGER,
    ResourceID INTEGER,
    Rating INTEGER CHECK(Rating >= 1 AND Rating <=5),
    Comment TEXT,
    RatingDate TEXT,
    FOREIGN KEY(UserID) REFERENCES Users(UserID),
    FOREIGN KEY(ResourceID) REFERENCES DigitalResources(ResourceID)
);


-- Insert sample data into DigitalResources
INSERT INTO DigitalResources VALUES
(1, 'How The Secret Changed My Life', 'Book', 'Rhonda Byrne', 2006, NULL, 'PDF', 3.5),
(2, 'Negative Self-Talk', 'Book', 'Shad Helmstetter PHD', 2019, NULL, 'EPUB', 4.2),
(3, 'The Little Prince', 'Book', 'Antoine De Saint-Exupery', 1943, NULL, 'PDF', 2.8);

-- Insert sample data into Users
INSERT INTO Users VALUES
(1, 'Neda', 'neda@example.com', 'Regular', '2023-03-01'),
(2, 'Miso', 'miso@example.com', 'Premium', '2022-09-23');

-- Insert sample data into Downloads
INSERT INTO Downloads VALUES
(1, 1, 2, '2025-07-10'),
(2, 2, 3, '2025-07-11');

-- Insert sample data into Tags
INSERT INTO Tags VALUES
(1, 'Self-help'),
(2, 'Psychology'),
(3, 'Fiction');

-- Insert sample data into ResourceTag (linking resources to tags)
INSERT INTO ResourceTag VALUES
(1, 1),
(2, 2),
(3, 3);

-- Insert sample data into Ratings
INSERT INTO Ratings VALUES
(1, 1, 3, 5, 'Great book for everyone!', '2025-07-12'),
(2, 2, 1, 4, 'Helpful and inspiring.', '2025-07-13');

SELECT * FROM DigitalResources;
SELECT * FROM Users;
SELECT * FROM Downloads;
SELECT * FROM Tags;
SELECT * FROM ResourceTag;
SELECT * FROM Ratings;
