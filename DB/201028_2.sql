--DML
SELECT * FROM emp;
INSERT INTO
    emp(empno, ename, job, mgr, hiredate, sal)
VALUES(8000, 'ABC', 'SALESMAN', 7839, sysdate, 10000, 10);

CREATE TABLE emp_research
AS (SELECT * FROM emp WHERE 1=0);

SELECT * FROM emp;
SELECT * FROM dept;
INSERT INTO emp_research (SELECT * FROM emp WHERE deptno=20);
--INSERT INTO 테이블이름(쿼리);
SELECT * FROM emp_research;

CREATE TABLE emp_hire AS SELECT empno, ename, hiredate FROM emp WHERE 1=0;
CREATE TABLE emp_sal AS SELECT empno, ename, sal FROM emp WHERE 1=0;
SELECT * FROM emp_hire;
SELECT * FROM emp_sal;

desc emp_hire;

INSERT ALL
WHEN HIREDATE > '2010/01/01'
THEN INTO emp_hire VALUES(empno, ename, hiredate)
WHEN sal>=2000
THEN INTO emp_sal VALUES(empno, ename, sal)
SELECT empno, ename, hiredate, sal FROM emp;

SELECT * FROM emp;

UPDATE emp
SET SAL = 1200
WHERE empno = 7369;

--서브쿼리
UPDATE emp
SET sal = sal* 1.1
WHERE deptno IN
(SELECT deptno FROM dept WHERE dname IN('SALES', 'ACCOUNTING'));
-- WHERE deptno IN(10,30);

SELECT * FROM emp;
DELETE FROM emp WHERE sal < 3000;
ROLLBACK;

--MERGE
CREATE TABLE emp_merge_ex
AS SELECT empno, ename, sal, deptno FROM emp WHERE deptno IN (10, 20);
SELECT * FROM emp_merge_ex;

MERGE INTO emp_merge_ex m
USING (
    SELECT empno, ename, deptno, sal FROM emp WHERE deptno IN (20, 30)
) e
ON (m.empno = e.empno)
WHEN MATCHED THEN
    UPDATE SET m.sal = round(m.sal * 1.1)
WHEN NOT MATCHED THEN 
    INSERT (m.empno, m.ename, m.sal, m.deptno) 
    VALUES (e.empno, e.ename, e.sal, e.deptno)
    WHERE e.sal > 1000;



--TCL
CREATE TABLE bank_account(
    id NUMBER PRIMARY KEY,
    name VARCHAR2(32) NOT NULL,
    money NUMBER DEFAULT 0
);
SELECT * FROM bank_account;
COMMIT;
INSERT INTO bank_account(id, name, money) VALUES (1, 'A', 1000);
INSERT INTO bank_account(id, name, money) VALUES (2, 'B', 0);


--A 계좌를 0으로 업데이트
--B 계좌를 100으로 업데이트
--transaction시작
UPDATE bank_account SET money = 0 WHERE name = 'A';
UPDATE bank_account SET money = 1000 WHERE name = 'B';
--transaction 끝
SELECT * FROM bank_account;
ROLLBACK;
--롤백하면 원상복귀. 모든 쿼리들을 취소.
COMMIT;
--영구적으로 반여하려면 커밋.








