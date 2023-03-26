-- CREATE DATABASE todolist2;-- 

CREATE TABLE tasks (
    task_id INT PRIMARY KEY AUTO_INCREMENT,
    task_name VARCHAR(255) NOT NULL,
    category_id INT,
    due_date DATE,
    priority INT
);

INSERT INTO tasks (task_name, category_id, due_date, priority)
VALUES
    ('Finish project proposal', 2, '2023-03-25', 1),
    ('Call mom', 5, '2023-03-22', 3),
    ('Buy groceries', 1, '2023-03-20', 2),
    ('Clean bathroom', 4, '2023-03-23', 4),
    ('Read book for book club', 6, '2023-03-28', 2),
    ('Pay rent', 3, '2023-03-31', 1),
    ('Schedule dentist appointment', 7, '2023-03-24', 3),
    ('Go for a run', 8, '2023-03-19', 2),
    ('Finish coding challenge', 2, '2023-03-27', 1),
    ('Email client about project updates', 2, '2023-03-26', 3),
    ('Attend team meeting', 9, '2023-03-21', 2),
    ('Prepare presentation slides', 2, '2023-03-30', 1),
    ('Go to yoga class', 8, '2023-03-29', 3),
    ('Pay credit card bill', 3, '2023-03-17', 1),
    ('Catch up on emails', 5, '2023-03-18', 2),
    ('Finish online course', 6, '2023-03-29', 1),
    ('Start planning summer vacation', 10, '2023-03-31', 2),
    ('Organize closet', 4, '2023-03-26', 3),
    ('Update resume', 2, '2023-03-28', 1),
    ('Buy new running shoes', 1, '2023-03-19', 2);
    

CREATE TABLE category (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(255) NOT NULL
);

INSERT INTO category (category_name)
VALUES
    ('Work'),
    ('Shopping'),
    ('Bills'),
    ('Household'),
    ('Personal'),
    ('Education'),
    ('Health'),
    ('Fitness'),
    ('Home'),
    ('Travel');
    
CREATE TABLE spending (
    spending_id INT PRIMARY KEY AUTO_INCREMENT,
    item_name VARCHAR(255) NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    category_id INT,
    task_id INT,
    FOREIGN KEY (category_id) REFERENCES category(category_id),
    FOREIGN KEY (task_id) REFERENCES tasks(task_id)
);

INSERT INTO spending (item_name, amount, category_id, task_id)
VALUES
    ('Finish project proposal printing', 12.50, 1, 1),
    ('Call mom', 0.00, 3, 2),
    ('Groceries', 42.50, 2, 3),
    ('Cleaning supplies', 25.00, 4, 4),
    ('Book for book club', 15.99, 2, 5),
    ('Rent payment', 1200.00, 1, 6),
    ('Dentist appointment', 75.00, 3, 7),
    ('Printer ink for project proposal', 35.00, 1, 1),
	('Groceries', 32.75, 1, 3),
	('Toilet cleaner', 8.99, 4, 4),
	('Book for book club', 12.50, 2, 5),
	('Rent payment', 1200.00, 3, 6),
	('Dental cleaning', 125.00, 7, 7),
	('Running shoes', 85.00, 1, 8),
	('Coding course subscription', 49.99, 6, 9),
	('Client gift', 75.00, 2, 10),
	('Team lunch', 75.00, 5, 11),
	('Yoga class package', 80.00, 8, 12),
	('Credit card payment', 150.00, 3, 14),
	('New suit for job interview', 250.00, 2, 20);
    

    
SELECT tasks.*, spending.*
FROM tasks
JOIN spending
ON tasks.task_id = spending.task_id;

-- SELECT tasks.task_name, tasks.due_date, tasks.priority, spending.item_name, spending.amount, category.category_name
-- FROM tasks
-- JOIN spending
-- ON tasks.task_id = spending.task_id
-- JOIN category
-- ON spending.category_id = category.category_id = tasks.category_id;

SELECT tasks.task_name, tasks.due_date, tasks.priority, spending.item_name, spending.amount, category.category_name
FROM tasks
JOIN spending ON tasks.task_id = spending.task_id
JOIN category ON spending.category_id = category.category_id AND category.category_id = tasks.category_id;

SELECT tasks.task_name, spending.item_name, SUM(spending.amount), category.category_name
FROM tasks
JOIN spending ON tasks.task_id = spending.task_id
JOIN category ON spending.category_id = category.category_id AND category.category_id = tasks.category_id;

SELECT category.category_name, SUM(spending.amount) AS "Total Spent"
FROM spending
JOIN category
ON category.category_id = spending.category_id
GROUP BY category.category_name
ORDER BY SUM(spending.amount) DESC;

UPDATE spending
SET amount = 50.00
WHERE spending_id = 3;

DELETE FROM spending
WHERE spending_id = 4;
