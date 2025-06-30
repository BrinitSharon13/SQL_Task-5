CREATE TABLE DEPT (
DEPTNO INT PRIMARY KEY,
DNAME VARCHAR(50),
LOC VARCHAR(50));

INSERT INTO DEPT (DEPTNO,DNAME,LOC) VALUES
(10,"Accounting","New york"),
(20,"Research","Dallas"),
(30,"Sales","Chicago"),
(40,"Operations","Boston");

SELECT * FROM DEPT;


/* Write a query to display employee names and their department names using an INNER JOIN.*/
SELECT E1.ENAME,D1.DNAME 
FROM EMP E1 ,DEPT D1
WHERE E1.DEPTNO = D1.DEPTNO;

/*Write a query to display all employees and their department details using a LEFT JOIN.*/
SELECT E1.*,D1.*
FROM EMP E1 LEFT OUTER JOIN DEPT D1
ON E1.DEPTNO = D1.DEPTNO;

/*Write a query to display all departments and their employees using a RIGHT JOIN.*/
SELECT E1.*,D1.*
FROM EMP E1 RIGHT JOIN DEPT D1
ON E1.DEPTNO = D1.DEPTNO;

/*Write a query to list all employees, including those who do not belong to any department (LEFT JOIN + IS NULL).*/
SELECT E1.*
FROM EMP E1 LEFT JOIN DEPT D1
ON E1.DEPTNO = D1.DEPTNO 
WHERE D1.DEPTNO IS NULL;

/*Display all departments, including those with no employees (RIGHT JOIN or LEFT JOIN from DEPT).*/
SELECT D1.*
FROM EMP E1 LEFT JOIN DEPT D1
ON E1.DEPTNO = D1.DEPTNO 
WHERE E1.DEPTNO IS NULL;

/*Use a FULL OUTER JOIN to display all employees and departments (even unmatched rows).*/
SELECT E1.*, D1.*
FROM EMP E1
LEFT JOIN DEPT D1 ON E1.DEPTNO = D1.DEPTNO
UNION
SELECT E1.*, D1.*
FROM EMP E1
RIGHT JOIN DEPT D1 ON E1.DEPTNO = D1.DEPTNO;

/*Write a query to display department name and total number of employees in each using a join and GROUP BY.*/
SELECT D1.DNAME,COUNT(E1.EMPNO)
FROM EMP E1 LEFT OUTER JOIN DEPT D1
ON E1.DEPTNO = D1.DEPTNO 
GROUP BY D1.DNAME;

/*List employee names, job titles, and department names using an appropriate join.*/
SELECT E1.ENAME,E1.JOB,D1.DNAME
FROM EMP E1 LEFT JOIN DEPT D1
ON E1.DEPTNO = D1.DEPTNO;

/*Display departments with more than 5 employees using join and HAVING.*/
SELECT D1.DNAME,COUNT(E1.EMPNO)
FROM EMP E1 LEFT JOIN DEPT D1
ON E1.DEPTNO = D1.DEPTNO 
GROUP BY D1.DNAME
HAVING COUNT(E1.EMPNO) > 5;

/*Find employees who work in the 'Sales' department using a join and WHERE.*/
SELECT E1.ENAME
FROM EMP E1 LEFT JOIN DEPT D1
ON E1.DEPTNO = D1.DEPTNO
WHERE D1.DNAME = "SALES";

/*Write a query to list employees whose department is located in 'New York'.*/
SELECT E1.ENAME
FROM EMP E1 LEFT JOIN DEPT D1
ON E1.DEPTNO = D1.DEPTNO
WHERE D1.LOC = "New york";

/*Show employee name, department name, and location using join.*/
SELECT E1.ENAME,D1.DNAME,D1.LOC
FROM EMP E1 JOIN DEPT D1
ON E1.DEPTNO = D1.DEPTNO;

/*Write a query to count the number of employees in each department including departments with zero employees.*/
SELECT COUNT(E1.EMPNO)
FROM EMP E1 JOIN DEPT D1
ON E1.DEPTNO = D1.DEPTNO
GROUP BY D1.DNAME;

/*Write a query to display the highest salary in each department using a join and GROUP BY.*/
SELECT D1.DNAME,MAX(E1.SAL)
FROM EMP E1 JOIN DEPT D1
ON E1.DEPTNO = D1.DEPTNO
GROUP BY D1.DNAME;

/*Write a query to display employees who earn more than the average salary of their department.*/
SELECT E1.ENAME,E1.SAL,D1.DNAME
FROM EMP E1 JOIN DEPT D1
ON E1.DEPTNO = D1.DEPTNO
WHERE E1.SAL > (SELECT AVG(E1.SAL)
FROM EMP E1 JOIN DEPT D1
ON E1.DEPTNO = D1.DEPTNO);

/*List employees with their manager names using a self-join on the EMP table.*/
SELECT E1.ENAME , E2.ENAME AS MGR_NAME
FROM EMP E1 LEFT JOIN EMP E2
ON E1.EMPNO = E2.MGR;

/*Find all employees who do not belong to any department (missing foreign key in deptno)*/
SELECT E.*
FROM emp E
LEFT JOIN dept D ON E.deptno = D.deptno
WHERE D.deptno IS NULL;

/*Write a query to display employee and department details sorted by department name.*/
SELECT E1.ENAME,D1.DNAME
FROM EMP E1 JOIN DEPT D1
ON E1.DEPTNO = D1.DEPTNO
ORDER BY D1.DNAME;

/*Show the total salary paid by each department using join and aggregation.*/
SELECT SUM(E1.SAL)
FROM EMP E1 JOIN DEPT D1
ON E1.DEPTNO = D1.DEPTNO
GROUP BY D1.DNAME;

/*Display departments and the average employee salary in each using a join and AVG().*/
SELECT D.dname, AVG(E.sal) AS avg_salary
FROM dept D
JOIN emp E ON D.deptno = E.deptno
GROUP BY D.dname;

