-- Create Users table
CREATE TABLE Users (
    UserID INTEGER PRIMARY KEY AUTOINCREMENT,
    Name TEXT NOT NULL,
    Email TEXT NOT NULL UNIQUE,
    Password TEXT NOT NULL,
    Bio TEXT,
    ProfilePic TEXT
);

-- Create Projects table
CREATE TABLE Projects (
    ProjectID INTEGER PRIMARY KEY AUTOINCREMENT,
    UserID INTEGER,
    Title TEXT NOT NULL,
    Description TEXT NOT NULL,
    Category TEXT,
    Tags TEXT,
    DateCreated DATETIME DEFAULT CURRENT_TIMESTAMP,
    LastUpdated DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Create Connections table
CREATE TABLE Connections (
    ConnectionID INTEGER PRIMARY KEY AUTOINCREMENT,
    UserID1 INTEGER,
    UserID2 INTEGER,
    Status TEXT,
    DateConnected DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID1) REFERENCES Users(UserID),
    FOREIGN KEY (UserID2) REFERENCES Users(UserID)
);

-- Create Comments table
CREATE TABLE Comments (
    CommentID INTEGER PRIMARY KEY AUTOINCREMENT,
    ProjectID INTEGER,
    UserID INTEGER,
    CommentText TEXT NOT NULL,
    DatePosted DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Create Messages table
CREATE TABLE Messages (
    MessageID INTEGER PRIMARY KEY AUTOINCREMENT,
    SenderID INTEGER,
    ReceiverID INTEGER,
    MessageText TEXT NOT NULL,
    DateSent DATETIME DEFAULT CURRENT_TIMESTAMP,
    IsRead BOOLEAN DEFAULT 0,
    FOREIGN KEY (SenderID) REFERENCES Users(UserID),
    FOREIGN KEY (ReceiverID) REFERENCES Users(UserID)
);

-- Insert sample users
INSERT INTO Users (Name, Email, Password, Bio, ProfilePic) VALUES 
('Alice Johnson', 'alice@example.com', 'password123', 'AI enthusiast', 'alice.jpg'),
('Bob Smith', 'bob@example.com', 'password456', 'Architecture student', 'bob.jpg'),
('Charlie Davis', 'charlie@example.com', 'password789', 'Data Scientist', 'charlie.jpg'),
('David Brown', 'david@example.com', 'password012', 'Machine Learning expert', 'david.jpg'),
('Eva Green', 'eva@example.com', 'password345', 'Renewable energy advocate', 'eva.jpg'),
('Frank White', 'frank@example.com', 'password678', 'Blockchain enthusiast', 'frank.jpg'),
('Grace Lee', 'grace@example.com', 'password901', 'Healthcare technologist', 'grace.jpg'),
('Hannah Miller', 'hannah@example.com', 'password234', 'Cybersecurity specialist', 'hannah.jpg'),
('Ian Harris', 'ian@example.com', 'password567', 'IoT developer', 'ian.jpg'),
('Jack Wilson', 'jack@example.com', 'password890', 'Robotics engineer', 'jack.jpg'),
('Kathy Martinez', 'kathy@example.com', 'password321', 'Quantum computing researcher', 'kathy.jpg'),
('Leo Adams', 'leo@example.com', 'password654', 'Augmented Reality designer', 'leo.jpg'),
('Mia Scott', 'mia@example.com', 'password987', 'Virtual Reality developer', 'mia.jpg'),
('Nathan Clark', 'nathan@example.com', 'password210', 'Cloud computing expert', 'nathan.jpg'),
('Olivia Robinson', 'olivia@example.com', 'password543', 'Big Data analyst', 'olivia.jpg'),
('Peter Lewis', 'peter@example.com', 'password876', 'Software engineer', 'peter.jpg'),
('Quinn Walker', 'quinn@example.com', 'password109', 'Data scientist', 'quinn.jpg'),
('Rachel Young', 'rachel@example.com', 'password432', 'AI researcher', 'rachel.jpg'),
('Sam King', 'sam@example.com', 'password765', 'Full-stack developer', 'sam.jpg'),
('Tina Baker', 'tina@example.com', 'password098', 'DevOps engineer', 'tina.jpg');

-- Insert sample projects
INSERT INTO Projects (UserID, Title, Description, Category, Tags) VALUES 
(1, 'AI Chatbot', 'An AI chatbot project using Python.', 'Computer Science', 'AI, Chatbot, Python'),
(2, 'Sustainable Architecture', 'A project on eco-friendly building designs.', 'Architecture', 'Sustainability, Architecture, Eco-friendly'),
(3, 'Machine Learning Model', 'A project on building a machine learning model.', 'Data Science', 'Machine Learning, Python, Data Science'),
(4, 'Deep Learning for Image Recognition', 'Using deep learning techniques to recognize images.', 'Artificial Intelligence', 'Deep Learning, Image Recognition, AI'),
(5, 'Solar Energy Harvesting', 'Designing efficient solar energy systems.', 'Renewable Energy', 'Solar Energy, Renewable, Sustainability'),
(6, 'Blockchain-Based Voting System', 'A secure voting system using blockchain.', 'Blockchain', 'Blockchain, Voting, Security'),
(7, 'AI in Healthcare', 'Using AI to improve healthcare outcomes.', 'Healthcare', 'AI, Healthcare, Technology'),
(8, 'Cybersecurity Threat Detection', 'Detecting threats using advanced cybersecurity techniques.', 'Cybersecurity', 'Cybersecurity, Threat Detection, Security'),
(9, 'Smart Home IoT System', 'Developing an IoT system for smart homes.', 'Internet of Things', 'IoT, Smart Home, Automation'),
(10, 'Autonomous Robotics', 'Creating autonomous robots for various applications.', 'Robotics', 'Autonomous, Robotics, Engineering'),
(11, 'Quantum Computing Algorithms', 'Exploring algorithms for quantum computers.', 'Quantum Computing', 'Quantum Computing, Algorithms, Research'),
(12, 'AR for Education', 'Using Augmented Reality for educational purposes.', 'Augmented Reality', 'AR, Education, Technology'),
(13, 'VR Training Simulations', 'Creating VR simulations for training.', 'Virtual Reality', 'VR, Training, Simulation'),
(14, 'Cloud-Based Data Storage', 'Designing a secure cloud-based data storage system.', 'Cloud Computing', 'Cloud, Data Storage, Security'),
(15, 'Big Data Analytics', 'Analyzing big data to extract valuable insights.', 'Data Science', 'Big Data, Analytics, Data Science'),
(16, 'Web Application Development', 'Developing a full-stack web application.', 'Software Development', 'Web Development, Full-Stack, Application'),
(17, 'Data Visualization Tools', 'Creating tools for effective data visualization.', 'Data Science', 'Data Visualization, Tools, Data Science'),
(18, 'AI Research on Natural Language Processing', 'Research on NLP techniques.', 'Artificial Intelligence', 'AI, NLP, Research'),
(19, 'DevOps Automation', 'Automating DevOps processes.', 'DevOps', 'DevOps, Automation, CI/CD'),
(20, 'Mobile App Development', 'Developing a mobile application for fitness tracking.', 'Mobile Development', 'Mobile, App, Fitness');

-- Insert sample connections
INSERT INTO Connections (UserID1, UserID2, Status) VALUES 
(1, 2, 'Pending'), (2, 3, 'Accepted'), (3, 4, 'Pending'), (4, 5, 'Accepted'),
(5, 6, 'Pending'), (6, 7, 'Accepted'), (7, 8, 'Pending'), (8, 9, 'Accepted'),
(9, 10, 'Pending'), (10, 11, 'Accepted'), (11, 12, 'Pending'), (12, 13, 'Accepted'),
(13, 14, 'Pending'), (14, 15, 'Accepted'), (15, 16, 'Pending'), (16, 17, 'Accepted'),
(17, 18, 'Pending'), (18, 19, 'Accepted'), (19, 20, 'Pending'), (20, 1, 'Accepted');

-- Insert sample comments
INSERT INTO Comments (ProjectID, UserID, CommentText) VALUES 
(1, 2, 'Great project! Very inspiring.'), (2, 3, 'I love the idea of sustainability.'), 
(3, 1, 'Impressive work on machine learning.'), (4, 5, 'Fantastic use of deep learning.'), 
(5, 6, 'Innovative approach to solar energy.'), (6, 7, 'Blockchain can really secure voting.'), 
(7, 8, 'AI in healthcare is the future.'), (8, 9, 'Important work on threat detection.'), 
(9, 10, 'Smart homes are the way forward.'), (10, 11, 'Autonomous robots are amazing.'), 
(11, 12, 'Quantum computing is so intriguing.'), (12, 13, 'AR can revolutionize education.'), 
(13, 14, 'VR training is very effective.'), (14, 15, 'Cloud storage is the future.'), 
(15, 16, 'Big data analytics are powerful.'), (16, 17, 'Great full-stack application.'), 
(17, 18, 'Very useful data visualization tools.'), (18, 19, 'NLP research is fascinating.'), 
(19, 20, 'Automation in DevOps is crucial.'), (20, 1, 'Nice mobile fitness app.');

-- Insert sample messages
INSERT INTO Messages (SenderID, ReceiverID, MessageText) VALUES 
(1, 2, 'Hi Bob, I loved your project on sustainable architecture!'),
(2, 3, 'Hey Charlie, can we collaborate on a data science project?'),
(3, 4, 'David, your deep learning project is fantastic!'),
(4, 5, 'Eva, your solar energy project is very innovative.'),
(5, 6, 'Frank, blockchain-based voting is a great idea.'),
(6, 7, 'Grace, I am impressed by your AI in healthcare project.'),
(7, 8, 'Hannah, your cybersecurity project is very important.'),
(8, 9, 'Ian, smart home IoT systems are the future.'),
(9, 10, 'Jack, your autonomous robotics project is amazing.'),
(10, 11, 'Kathy, quantum computing algorithms are fascinating.'),
(11, 12, 'Leo, AR for education can revolutionize learning.'),
(12, 13, 'Mia, VR training simulations are very effective.'),
(13, 14, 'Nathan, y2our cloud-based data storage system is very secure.'),
(14, 15, 'Olivia, big data analytics are very powerful.'),
(15, 16, 'Peter, great job on the web application development.'),
(16, 17, 'Quinn, your data visualization tools are very useful.'),
(17, 18, 'Rachel, your NLP research is very interesting.'),
(18, 19, 'Sam, automation in DevOps is crucial.'),
(19, 20, 'Tina, great work on the mobile app development.'),
(20, 1, 'Alice, your AI chatbot project is fascinating!');
