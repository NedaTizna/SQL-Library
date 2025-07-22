# Digital Library Management System

Welcome to the Digital Library Management System project!
This database system helps manage various digital resources such as e-books, articles, videos, and more. It allows users to browse, download, rate, and review digital materials efficiently.

## Project Overview :
 This project includes the following main components:

### 1. DigitalResources Table
Stores detailed information about each digital resource (e.g., books, articles, videos).
Fields include a unique ID, title, type, author, publication year, download URL, file format, and file size.

### 2. Users Table
Contains information about system users or library members.
Stores user ID, name, unique email, membership type, and join date.

### 3. Downloads Table
Records each instance when a user downloads a digital resource.
Tracks who downloaded what and when.

### 4. Tags Table
Holds keywords or tags used to categorize resources by topics or characteristics.

### 5. ResourceTags Table
Manages the many-to-many relationship between digital resources and tags.
Allows assigning multiple tags to a single resource and vice versa.

### 6. Ratings Table
Stores user ratings and reviews for digital resources.
Ratings are between 1 (lowest) and 5 (highest), and users can leave textual reviews.

## Why This Project?
-It provides a comprehensive way to manage diverse digital materials.
-Enables detailed tracking of user interactions and downloads.
-Supports categorization through tags and quality feedback via ratings.
-Useful for libraries, educational platforms, or any digital content provider.

## Sample Data :

'''sql
-- Insert sample data into DigitalResources
INSERT INTO DigitalResources (Title, Resourcetype, Author, PublicationYear, URL, Format, SizeMB)
VALUES
('How The Secret Changed My Life', 'Book', 'Rhonda Byrne', 2006, NULL, 'PDF', 3.5),
('Negative Self-Talk', 'Book', 'Shad Helmstetter PHD', 2019, NULL, 'EPUB', 4.2),
('The Little Prince', 'Book', 'Antoine De Saint-Exupery', 1943, NULL, 'PDF', 2.8);

-- Insert sample data into Users
INSERT INTO Users (Name, Email, Membershiptype, JoinDate)
VALUES
('Neda', 'neda@example.com', 'Regular', '2023-03-01'),
('Miso', 'miso@example.com', 'Premium', '2022-09-23');

## Sample Queries :

-- Select all digital resources
SELECT * FROM DigitalResources;

-- Find downloads by a specific user
SELECT d.DownloadDate, r.Title
FROM Downloads d
JOIN DigitalResources r ON d.ResourceID = r.ResourceID
JOIN Users u ON d.UserID = u.UserID
WHERE u.Name = 'Neda';

-- Show average rating for each resource
SELECT r.Title, AVG(rt.Rating) AS AverageRating
FROM Ratings rt
JOIN DigitalResources r ON rt.ResourceID = r.ResourceID
GROUP BY rt.ResourceID;

How to Run
You can execute this SQL script in any SQLite environment, such as:
.sqliteonline.com (Online SQLite editor)
.DB Browser for SQLite (Desktop application)
.Any SQL client supporting SQLite databases
Just load the .sql file and run all commands sequentially from top to bottom.

Developed by Neda, with passion for digital libraries.