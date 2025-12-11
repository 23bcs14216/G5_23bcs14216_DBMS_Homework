--session 4
--ques 1
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50)
);

INSERT INTO Students (student_id, student_name) VALUES
(1, 'Alice'),
(2, 'Bob'),
(13, 'John'),
(6, 'Alex');

CREATE TABLE Subjects (
    subject_name VARCHAR(50) PRIMARY KEY
);

INSERT INTO Subjects (subject_name) VALUES
('Math'),
('Physics'),
('Programming');

CREATE TABLE Examinations (
    student_id INT,
    subject_name VARCHAR(50)
);

INSERT INTO Examinations (student_id, subject_name) VALUES
(1, 'Math'),
(1, 'Physics'),
(1, 'Programming'),
(2, 'Programming'),
(1, 'Physics'),
(1, 'Math'),
(13, 'Math'),
(13, 'Programming'),
(13, 'Physics'),
(2, 'Math'),
(1, 'Math');

select A.*, B.*, count(C.subject_name) as attended_exams from Students A 
cross join Subjects B 
left join Examinations C 
on A.student_id = C.student_id 
and B.subject_name=C.subject_name
group by A.student_id, A.student_name, B.subject_name
ORDER BY A.student_id, B.subject_name;


--Ques 2
CREATE TABLE Transactions (
    id INT PRIMARY KEY,
    country VARCHAR(10),
    state VARCHAR(20),
    amount INT,
    trans_date DATE
);

INSERT INTO Transactions (id, country, state, amount, trans_date) VALUES
(121, 'US', 'approved', 1000, '2018-12-18'),
(122, 'US', 'declined', 2000, '2018-12-19'),
(123, 'US', 'approved', 2000, '2019-01-01'),
(124, 'DE', 'approved', 2000, '2019-01-07');


SELECT
  DATE_FORMAT(trans_date, '%Y-%m') AS month,  
  country,                                    
  COUNT(*) AS trans_count,                   
  SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) AS approved_count,  
  SUM(amount) AS trans_total_amount,          
  SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount 
FROM Transactions
GROUP BY DATE_FORMAT(trans_date, '%Y-%m'), country;

