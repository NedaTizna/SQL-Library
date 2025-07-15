CREATE TABLE Books (
    BookID INTEGER PRIMARY KEY,
    Title TEXT NOT NULL,
    Author TEXT,
    Publishedyear INTEGER,
    Available BOOLEAN
);

CREATE TABLE Members(
    MemberID INTEGER PRIMARY KEY,
    Name TEXT NOT NULL,
    JoinDate DATE
);

CREATE TABLE Borrowings(
    BorrowID INTEGER PRIMARY KEY,
    BookID INTEGER,
    MemberID INTEGER,
    BorrowDate DATE,
    ReturnDate DATE,
    FOREIGN KEY(BookID) REFERENCES Books(BookID),
    FOREIGN KEY(MemberID) REFERENCES Members(MemberID)
);

INSERT INTO Books VALUES
(1,'How The Secret Changed My Life','Rhonda Byrne',2006,TRUE),
(2,'Negative Self-Talk','Shad Helmstetter PHD',2019,FALSE),
(3,'The Little Prince','Antoine De Saint-Exupery',1943,TRUE);

INSERT INTO Members VALUES
(1,'Neda','2023-03-01'),
(2,'Miso','2022-09-23');

INSERT INTO Borrowings VALUES
(1,2,1,'2025-07-10', NULL);

SELECT * FROM Books WHERE Available = TRUE;

SELECT  b.Title, br.BorrowDate
FROM Borrowings br
JOIN Books b ON br.BookID = b.BookID
JOIN Members m ON br.MemberID = m.MemberID
WHERE m.Name = 'Neda';

