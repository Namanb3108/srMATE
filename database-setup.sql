-- srMATE Database Setup Script
-- Run this script in MySQL Workbench before running the application

-- Create Database
DROP DATABASE IF EXISTS srmatedb;
CREATE DATABASE srmatedb;
USE srmatedb;

-- Create Users Table
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
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Matches Table
CREATE TABLE matches (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    matched_user_id INT,
    action VARCHAR(20),
    matched_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (matched_user_id) REFERENCES users(id)
);

-- Create Messages Table
CREATE TABLE messages (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sender_id INT,
    receiver_id INT,
    message TEXT,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sender_id) REFERENCES users(id),
    FOREIGN KEY (receiver_id) REFERENCES users(id)
);

-- Verify Tables Created
SHOW TABLES;

SELECT 'Database setup completed successfully!' AS Status;