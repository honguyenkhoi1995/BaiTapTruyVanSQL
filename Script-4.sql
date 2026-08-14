CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(255),
    salary DECIMAL(10, 2),
    start_date DATE,
    department_id INT
);
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(255)
);
CREATE TABLE access_rights (
    access_id INT PRIMARY KEY,
    employee_id INT,
    access_level VARCHAR(255),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);
INSERT INTO departments (department_id, department_name)
VALUES
(1, 'IT'),
(2, 'Sales'),
(3, 'HR');
INSERT INTO employees 
(employee_id, employee_name, salary, start_date, department_id)
VALUES
(1, 'John Doe', 60000, '2021-01-15', 1),
(2, 'Jane Smith', 70000, '2020-05-20', 2),
(3, 'Bob Johnson', 55000, '2022-03-10', 1),
(4, 'Alice Williams', 80000, '2021-08-05', 3),
(5, 'Charlie Brown', 65000, '2020-12-01', 2);
INSERT INTO access_rights
(access_id, employee_id, access_level)
VALUES
(1, 1, 'Admin'),
(2, 2, 'User'),
(3, 3, 'User'),
(4, 4, 'Admin'),
(5, 5, 'User');
SHOW TABLES;

-- CÂU 1:
-- Hiển thị tất cả thông tin của bảng employees
SELECT *
FROM employees;


-- CÂU 2:
-- Hiển thị tên và lương của tất cả nhân viên
SELECT employee_name, salary
FROM employees;


-- CÂU 3:
-- Hiển thị thông tin nhân viên có lương lớn hơn 50000
SELECT *
FROM employees
WHERE salary > 50000;


-- CÂU 4:
-- Hiển thị số lượng nhân viên trong mỗi phòng ban
SELECT 
    department_id,
    COUNT(*) AS employee_count
FROM employees
GROUP BY department_id;


-- CÂU 5:
-- Sắp xếp danh sách nhân viên theo tên từ A-Z
SELECT *
FROM employees
ORDER BY employee_name ASC;


-- CÂU 6:
-- Hiển thị tên, lương và phòng ban
-- của nhân viên có lương từ 40000 đến 60000
-- và sắp xếp lương giảm dần
SELECT 
    e.employee_name,
    e.salary,
    d.department_name
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id
WHERE e.salary BETWEEN 40000 AND 60000
ORDER BY e.salary DESC;


-- CÂU 7:
-- Tính tổng lương của tất cả nhân viên
SELECT 
    SUM(salary) AS total_salary
FROM employees;


-- CÂU 8:
-- Hiển thị tên nhân viên và tên phòng ban của họ
SELECT 
    e.employee_name,
    d.department_name
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id;


-- CÂU 9:
-- Tìm những phòng ban có ít nhất 3 nhân viên
SELECT 
    d.department_name,
    COUNT(e.employee_id) AS employee_count
FROM departments d
JOIN employees e
    ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
HAVING COUNT(e.employee_id) >= 3;


-- CÂU 10:
-- Hiển thị tên và lương của nhân viên
-- thuộc phòng ban IT hoặc Sales
SELECT 
    e.employee_name,
    e.salary
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id
WHERE d.department_name IN ('IT', 'Sales');


-- CÂU 11:
-- Hiển thị tên và ngày bắt đầu làm việc
-- của nhân viên được tuyển dụng sau năm 2020
SELECT 
    employee_name,
    start_date
FROM employees
WHERE start_date >= '2021-01-01';


-- CÂU 12:
-- Tính lương trung bình của tất cả nhân viên
SELECT 
    AVG(salary) AS average_salary
FROM employees;


-- CÂU 13:
-- Hiển thị tất cả phòng ban và số lượng nhân viên
-- kể cả phòng ban không có nhân viên
SELECT 
    d.department_name,
    COUNT(e.employee_id) AS employee_count
FROM departments d
LEFT JOIN employees e
    ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;


-- CÂU 14:
-- Hiển thị 5 nhân viên có lương cao nhất
-- MySQL sử dụng LIMIT thay cho TOP
SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 5;


-- CÂU 15:
-- Tìm những nhân viên có tên bắt đầu bằng chữ "A"
-- % đại diện cho bất kỳ chuỗi ký tự nào phía sau A
SELECT *
FROM employees
WHERE employee_name LIKE 'A%';


-- CÂU 16:
-- Hiển thị tên nhân viên và quyền truy cập
-- của những người có quyền là Admin
SELECT 
    e.employee_name,
    a.access_level
FROM employees e
JOIN access_rights a
    ON e.employee_id = a.employee_id
WHERE a.access_level = 'Admin';


-- CÂU 17:
-- Tính tổng lương cho mỗi phòng ban
-- và sắp xếp theo tổng lương giảm dần
SELECT 
    d.department_name,
    SUM(e.salary) AS total_salary
FROM departments d
JOIN employees e
    ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
ORDER BY total_salary DESC;


-- CÂU 18:
-- Hiển thị nhân viên và ngày bắt đầu làm việc
-- sắp xếp theo ngày tăng dần
SELECT 
    employee_name,
    start_date
FROM employees
ORDER BY start_date ASC;


-- CÂU 19:
-- Tìm nhân viên có lương cao nhất trong từng phòng ban
-- Subquery dùng MAX() để tìm mức lương cao nhất
-- của từng department
SELECT 
    e.employee_name,
    e.salary,
    d.department_name
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id
WHERE e.salary = (
    SELECT MAX(e2.salary)
    FROM employees e2
    WHERE e2.department_id = e.department_id
);


-- CÂU 20:
-- Hiển thị nhân viên và quyền truy cập của họ
-- bao gồm cả nhân viên không có quyền truy cập
-- LEFT JOIN giúp giữ lại tất cả nhân viên
SELECT 
    e.employee_name,
    a.access_level
FROM employees e
LEFT JOIN access_rights a
    ON e.employee_id = a.employee_id;

SELECT * FROM employees;

SELECT * FROM departments;

