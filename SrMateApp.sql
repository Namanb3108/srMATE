-- ==========================================
-- srMATE Database Setup Script
-- ==========================================
-- This script creates the complete database structure
-- for the srMATE college connection application
-- ==========================================

-- Step 1: Create the database
DROP DATABASE IF EXISTS srmatedb;
CREATE DATABASE srmatedb;
USE srmatedb;

-- Step 2: Create Users table
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    registration_number VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    age INT,
    gender VARCHAR(20),
    college VARCHAR(100),
    department VARCHAR(100),
    year_of_study INT,
    interests TEXT,
    hobbies TEXT,
    looking_for VARCHAR(100),
    bio TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_email (email),
    INDEX idx_registration_number (registration_number)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Step 3: Create Matches table
CREATE TABLE matches (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    matched_user_id INT NOT NULL,
    action VARCHAR(20) NOT NULL,
    matched_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (matched_user_id) REFERENCES users(id) ON DELETE CASCADE,
    INDEX idx_user_id (user_id),
    INDEX idx_matched_user_id (matched_user_id),
    INDEX idx_mutual_match (user_id, matched_user_id, action)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Step 4: Create Messages table
CREATE TABLE messages (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sender_id INT NOT NULL,
    receiver_id INT NOT NULL,
    message TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sender_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (receiver_id) REFERENCES users(id) ON DELETE CASCADE,
    INDEX idx_sender_id (sender_id),
    INDEX idx_receiver_id (receiver_id),
    INDEX idx_conversation (sender_id, receiver_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ==========================================
-- Sample Data (Optional - for testing)
-- ==========================================
-- Uncomment the following INSERT statements to add sample users

-- Sample User 1
INSERT INTO users (name, email, registration_number, password, age, gender, college, department, year_of_study, interests, hobbies, looking_for, bio) 
VALUES (
    'Rahul Sharma',
    'rahul.sharma@srm.edu',
    'RA2011026010001',
    'password123',
    20,
    'Male',
    'SRM Institute of Science and Technology',
    'Computer Science Engineering',
    2,
    'Web Development, AI, Machine Learning',
    'Coding, Gaming, Photography',
    'Study Partner',
    'Tech enthusiast looking for study partners to collaborate on projects and prepare for placements together!'
);

-- Sample User 2
INSERT INTO users (name, email, registration_number, password, age, gender, college, department, year_of_study, interests, hobbies, looking_for, bio) 
VALUES (
    'Priya Nair',
    'priya.nair@srm.edu',
    'RA2011026010002',
    'password123',
    19,
    'Female',
    'SRM Institute of Science and Technology',
    'Information Technology',
    2,
    'Data Science, Cloud Computing, Android Development',
    'Reading, Dancing, Traveling',
    'Friend',
    'Looking to make genuine friendships and explore new technologies together!'
);

-- Sample User 3
INSERT INTO users (name, email, registration_number, password, age, gender, college, department, year_of_study, interests, hobbies, looking_for, bio) 
VALUES (
    'Arjun Patel',
    'arjun.patel@srm.edu',
    'RA2011026010003',
    'password123',
    21,
    'Male',
    'SRM Institute of Science and Technology',
    'Electronics and Communication',
    3,
    'IoT, Embedded Systems, Robotics',
    'Cricket, Music, Blogging',
    'Networking',
    'Building connections for future career opportunities and collaborative projects.'
);

-- Sample User 4
INSERT INTO users (name, email, registration_number, password, age, gender, college, department, year_of_study, interests, hobbies, looking_for, bio) 
VALUES (
    'Sneha Reddy',
    'sneha.reddy@srm.edu',
    'RA2011026010004',
    'password123',
    20,
    'Female',
    'SRM Institute of Science and Technology',
    'Computer Science Engineering',
    2,
    'Competitive Programming, Web Development, Blockchain',
    'Painting, Yoga, Cooking',
    'Study Partner',
    'Passionate coder seeking study partners for competitive programming and hackathons!'
);

-- Sample User 5
INSERT INTO users (name, email, registration_number, password, age, gender, college, department, year_of_study, interests, hobbies, looking_for, bio) 
VALUES (
    'Vikram Singh',
    'vikram.singh@srm.edu',
    'RA2011026010005',
    'password123',
    22,
    'Male',
    'SRM Institute of Science and Technology',
    'Mechanical Engineering',
    4,
    'CAD Design, Automation, Renewable Energy',
    'Gymming, Football, Gaming',
    'Any',
    'Final year student open to meeting new people and sharing experiences!'
);

-- ==========================================
-- Verification Queries
-- ==========================================
-- Run these queries to verify your database setup

-- Check if all tables were created
SELECT 'Tables Created Successfully!' AS Status;

-- View table structure
SHOW TABLES;

-- Count sample users (if inserted)
SELECT COUNT(*) AS total_users FROM users;

-- Display all users (if sample data inserted)
SELECT id, name, email, college, department FROM users;

-- ==========================================
-- Database Information
-- ==========================================
SELECT 
    'Database: srmatedb' AS Info
UNION ALL
SELECT 'Host: localhost:3306'
UNION ALL
SELECT 'Username: root'
UNION ALL
SELECT 'Password: (empty)'
UNION ALL
SELECT 'Status: Ready for srMATE application';