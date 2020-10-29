SELECT*FROM emp;
SELECT empno, ename, job, sal,
RANK() OVER(ORDER BY sal DESC) �޿�����
FROM emp;

SELECT RANK(50) WITHIN GROUP (ORDER BY sal DESC) AS ����
FROM emp;

SELECT ename, deptno, sal,
    RANK() OVER (ORDER BY sal DESC) "����1",
        DENSE_RANK() OVER (ORDER BY sal DESC) "����2",
        DENSE_RANK() OVER (PARTITION BY deptno ORDER BY sal DESC) "����3"
    FROM emp
ORDER BY ����1;

SELECT * FROM (
    SELECT ename, sal, RANK() OVER (ORDER BY sal DESC) ���� FROM emp)
    WHERE ���� <= 5;
SELECT * FROM (
    SELECT ename, sal, RANK() OVER (ORDER BY sal DESC) ���� FROM emp)
    WHERE ���� = 9;
    
--CUME_DIST()
SELECT ename, sal, ROUND(CUME_DIST() OVER (ORDER BY sal), 1) �����л�
FROM emp
WHERE deptno = 30;

--NTILE()
-- :: �޿��� 5������� �з�
SELECT ename, sal,
    NTILE(5) OVER(ORDER BY sal DESC ) ���
FROM emp;

--ROW_NUMBER()
--ORACLE���� /*ROWNUM���� �������
SELECT empno, ename, sal, hiredate,
    ROW_NUMBER() OVER (ORDER BY sal DESC, hiredate ASC) ����
FROM emp;



--�����Լ�
SELECT deptno, SUM(sal) s_sal
FROM emp
GROUP BY deptno ORDER BY s_sal DESC;

SELECT empno, sal,
SUM(sal) OVER (PARTITION BY deptno ORDER BY empno ROWS BETWEEN UNBOUNDED 
PRECEDING AND UNBOUNDED FOLLOWING) "win1",
-- rows : �κб׷��� �������� ũ�⸦ �������� ������ �������� ����
-- unbounded preceding : �������� ù��
-- unbounded following : �������� ��������
SUM(sal) OVER (PARTITION BY deptno ORDER BY empno ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) "win2",
-- �������� �����࿡�� ���� ��ġ(current row) ������ �հ踦 ���ؼ� win2��
SUM(sal) OVER (PARTITION BY deptno ORDER BY empno ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) "win3"
-- ���� ��ġ���� �������� ������������� �հ踦 ���ؼ� win3��
FROM emp
WHERE deptno = 30;

SELECT empno, sal,
SUM(sal) OVER (PARTITION BY deptno
ORDER BY empno
ROWS BETWEEN 1 PRECEDING
AND 1 FOLLOWING) "win1",
-- 1 preceding and 1 following
-- ���� ���� �߽����� ������� �������� �޿��հ�
SUM(sal) OVER (PARTITION BY deptno ORDER BY empno
ROWS BETWEEN 1 PRECEDING AND
CURRENT ROW) "win2",
-- 1 preceding and current row
-- ������� �������� �޿� �հ�
SUM(sal) OVER (PARTITION BY deptno ORDER BY empno
ROWS BETWEEN CURRENT ROW AND
1 FOLLOWING) "win3"
-- current row and 1 following
-- ���� ��� �������� �հ�
FROM emp
WHERE deptno = 30;

--RATIO_TO_REPORT
SELECT ename, sal,
    LPAD(TRUNC(RATIO_TO_REPORT(sal) OVER() * 100, 0), 5) || '%' ����,
    TO_CHAR(TRUNC(RATIO_TO_REPORT(sal) OVER() * 20000000, 0), 'L00,999,999') "�߰��� �ްԵ� �޿�"
FROM emp;

--Lag(��ȸ�� ����, ������ġ, ���� ������ġ)
SELECT ename, deptno, sal,
LAG(sal, 1, 0) OVER (ORDER BY sal) ������,
-- 1 : ���� �ప, 0 : �������� ������ 0 ó����
LAG(sal, 1, sal) OVER (ORDER BY sal) "��ȸ2",
-- �������� ������ ���� ���� ���� ���
LAG(sal, 1, sal) OVER (PARTITION BY deptno ORDER BY sal) "��ȸ3"
-- �μ� �׷�ȿ����� ���� �ప ���
FROM emp;


SELECT ename, deptno, sal,
    LEAD(sal, 1, 0) OVER (ORDER BY sal DESC) ������
FROM emp;


SELECT deptno, ename, sal
, FIRST_VALUE(ENAME) OVER
(PARTITION BY deptno ORDER BY sal DESC
ROWS UNBOUNDED PRECEDING) as DEPT_RICH
FROM emp;

SELECT deptno, ename, sal
, LAST_VALUE(ENAME) OVER ( PARTITION BY DEPTNO ORDER BY SAL DESC
ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) as DEPT_POOR
FROM EMP;


--JOIN**
SELECT * FROM emp;
SELECT * FROM dept;

SELECT e.*, d.dname, d.loc FROM emp e
JOIN dept d ON e.deptno = d.deptno;

SELECT * FROM emp, dept;

--������
SELECT * FROM salgrade;
SELECT * FROM emp;

SELECT e.ename, e.sal, s.grade
FROM emp e, salgrade s
WHERE e.sal
    BETWEEN s.losal AND s.hisal;

SELECT e.ename, e.sal, s.grade
FROM emp e
    JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal;
    
--SELF JOIN :: �ڰ�����
--���� ���� ǥ���� �� �����ϴ�.
SELECT * FROM emp;
SELECT e.ename, m.ename Manager
FROM emp e
    JOIN emp m ON e.empno = m.mgr;

--INNER JOIN**
SELECT e.ename, d.dname
FROM emp e
INNER JOIN dept d
ON e.deptno = d.deptno;

--OUTER JOIN
SELECT e.ename, e.deptno, d.dname
FROM emp e
    RIGHT OUTER JOIN dept d
ON e.deptno = d.deptno
ORDER BY e.deptno;

SELECT employee.ename employee, manager.ename manager
FROM emp employee LEFT OUTER JOIN emp manager
ON employee.mgr = manager.empno;

--CROSS JOIN
--ī�׽þ� ��
SELECT * FROM emp, dept;
SELECT count(*) FROM emp;
SELECT count(*) FROM dept;

SELECT *
FROM emp e
RIGHT JOIN dept d ON e.deptno = d.deptno;

SELECT * FROM emp e
JOIN dept d
USING (DEPTNO);
--�������� ON ��� ��ȣ.
--USING ����: ������.
--USING Ű���忡 �����Ǵ� �÷����� ���̺� ��Ī�� ���� ���¿��� �Ѵ�.
desc emp;
SELECT empno, name
FROM emp NATURAL JOIN test_no;

CREATE TABLE test_no (
    deptno NUMBER(2),
    name VARCHAR(128)
);
INSERT INTO test_no(deptno, name) VALUES (10, 'A');
INSERT INTO test_no(deptno, name) VALUES (20, 'B');
INSERT INTO test_no(deptno, name) VALUES (30, 'C');
COMMIT;

--��������
SELECT * FROM dept;

SELECT * FROM emp
WHERE deptno = (
    SELECT deptno FROM dept WHERE dname = 'ACCOUNTING'
); 
--()�ȿ� �ִ°� ��������.

SELECT * FROM emp 
WHERE sal >= (SELECT avg(sal) FROM emp);

SELECT * FROM emp
WHERE deptno IN (SELECT deptno FROM dept WHERE loc IN('NEW YORK', 'DALLAS'));
==IN(10, 20) -> ���� ���


--�μ��� �޿��� ���� ���� �޴� ��� ��ȸ
SELECT max(sal) FROM emp GROUP BY deptno; --��������

SELECT e.ename, d.dname, e.sal, d.deptno FROM emp e
JOIN dept d ON e.deptno = d.deptno
WHERE sal IN (SELECT max(sal) FROM emp GROUP BY deptno) ;
--1: �׷캰�� ���� ���� ������ ���
--SELECT max(sal) FROM emp GROUP BY deptno;
--2: emp, dept ����(�����)
--3: where �������� IN (2850, 3000, 5000)

--ANY������
SELECT empno, ename, job, sal
FROM emp
WHERE sal > ANY (SELECT sal FROM emp WHERE JOB = 'SALESMAN');
-- =����
SELECT sal FROM emp WHERE sal > 1250 
ORDER BY sal DESC;

SELECT empno, ename, job, sal
FROM emp
WHERE sal = ANY (SELECT sal FROM emp WHERE JOB = 'SALESMAN');

--ALL������
SELECT * FROM emp WHERE sal > 1250;
SELECT * FROM emp WHERE sal > ALL (SELECT max(sal) FROM emp WHERE job = 'MANAGER');
SELECT max(sal) FROM emp WHERE job = 'MANAGER';

--EXISTS ������
SELECT empno, ename, sal
FROM emp e
WHERE EXISTS (SELECT empno FROM emp WHERE e.empno = mgr);
SELECT DISTINCT mgr FROM emp WHERE not mgr is null;
SELECT mgr FROM emp WHERE NOT mgr is null GROUP BY mgr; --3�� �� ����.

--���� �� ��������
SELECT empno, ename, sal, deptno
FROM emp
WHERE (deptno, sal) IN (SELECT deptno, sal FROM emp WHERE deptno = 30);

SELECT deptno, sal FROM emp WHERE deptno = 30;

--��Į�� ��������
SELECT ename, deptno, sal,
-- �Ҽ� �μ��� �޿� ��հ� 1��
(SELECT TRUNC(AVG(SAL)) FROM EMP
WHERE DEPTNO = E.DEPTNO) AS AVGDEPTSAL
FROM EMP E;

SELECT TRUNC(AVG(SAL)) FROM emp;

SELECT EMPNO, ENAME,
    CASE
        WHEN DEPTNO = (SELECT DEPTNO FROM DEPT WHERE LOC = 'NEW YORK') THEN 'hq'
        ELSE 'branch'
    END AS �Ҽ�
FROM EMP E ORDER BY �Ҽ� DESC;


--��� ���� :: ��ȣ���� ��������
--���� ������ Ư�� �÷��� ���� �������� ����ϴ� ���� ����.

SELECT ename, job,
(SELECT dname FROM dept WHERE deptno = e.deptno) dname
FROM emp e;
--���Ʒ� ���� : �Ʒ��� �� ������~~~~
SELECT e.ename, e.job, d.dname
FROM emp e
JOIN dept d ON e.deptno = d.deptno;


SELECT dname FROM dept
WHERE deptno IN (SELECT deptno FROM emp e);
SELECT dname FROM dept
WHERE deptno = e.deptno;

--from�� ��������
SELECT b.empno, b.ename, b.job, b.sal, b.deptno
FROM (
    SELECT empno FROM emp WHERE sal > (SELECT AVG(sal) FROM emp WHERE deptno = 20)
) a, emp b WHERE a.empno = b.empno AND b.mgr is NOT NULL AND b.deptno != 20;
--1:���� ���ʿ� �ִ� ��������
SELECT AVG(sal) FROM emp WHERE deptno = 20;
--2:a
SELECT empno, ename FROM emp WHERE sal > (SELECT AVG(sal) FROM emp WHERE deptno = 20);
----������� �������� �м��غ���!*****

--ORDER BY�� ��������
SELECT EMPNO, ENAME, DEPTNO, HIREDATE
FROM EMP E
ORDER BY (SELECT DNAME
FROM DEPT
WHERE DEPTNO = E.DEPTNO) DESC;
--1
SELECT EMPNO, ENAME, DEPTNO, HIREDATE FROM EMP E;
--2
SELECT DNAME FROM DEPT;

----
--���տ�����
SELECT empno, ename, JOB FROM emp WHERE JOB = 'SALESMAN'
UNION
SELECT empno, ename, JOB FROM emp WHERE JOB = 'MANAGER';
--== ���Ʒ�����.
SELECT empno, ename, job FROM emp
WHERE job IN ('SALESMAN', 'MANAGER');

--INTERSECT
SELECT empno, ename, sal FROM emp WHERE sal > 1000
INTERSECT
SELECT empno, ename, sal FROM emp WHERE sal < 2000;

SELECT empno, ename, sal FROM emp WHERE sal > 1000 AND sal < 2000;


--MINUS::������
SELECT empno, ename, sal FROM emp
MINUS
SELECT empno, ename, sal FROM emp WHERE sal > 2000;

SELECT empno, ename, sal FROM emp WHERE sal <= 2000;

--DDL
--CREATE TABLE
DROP TABLE test_table;
CREATE TABLE test_table(
    id NUMBER,
    name VARCHAR2(128) CONSTRAINT test_table_nn NOT NULL, --�÷� ����
    CONSTRAINT test_table_pk PRIMARY KEY(id) --���̺� ����
);
SELECT * FROM test_table;

SELECT  table_name FROM USER_TABLES WHERE table_name = 'TEST';

DESC test_table;
--ALTER TABLE ���̺� �̸� ADD CONSTRAINT ���������̸� ������������(Į���̸�);
--ALTER ���ǻ��� :: �ߺ��Ǵ� ���� �߰ߵǸ� ���� ���� �� �� ����.
ALTER TABLE ���̺��̸� MODIFY (Į�� NOT NULL);
ALTER TABLE ���̺��̸� ADD CONSTRAINT ���������̸� ������������(Į���̸�);

ALTER TABLE test_table ADD CONSTRAINT test_table_name_uq UNIQUE(name);


CREATE TABLE user_info (
    id NUMBER PRIMARY KEY,
    name VARCHAR2(128) NOT NULL,
    email VARCHAR2(128) UNIQUE
);
INSERT INTO user_info(id, name, email) VALUES(10, 'ABC', 'a@b.com');
DROP TABLE bank_account;
CREATE TABLE bank_account(
    id NUMBER PRIMARY KEY,
    user_info_id NUMBER CONSTRAINT user_info_fk REFERENCES user_info(id),
    balance NUMBER DEFAULT 0
);
INSERT INTO bank_account(id, user_info_id) VALUES (1, 10);
SELECT * FROM bank_account;

--ON DELETE CASCADE
--ON DELETE SET NULL

--��������Ȯ��
SELECT * FROM user_constraints WHERE table_name = 'BANK_ACCOUNT';
SELECT * FROM user_cons_columns WHERE table_name = 'BANK_ACCOUNT';

--ALTER TABLE
CREATE TABLE test AS( SELECT  empno, ename, sal FROM emp WHERE 1=0);
SELECT * FROM test;
--�� �÷� �߰��ϱ�
ALTER TABLE ���̺��̸� ADD (�÷� ������Ÿ��);
ALTER TABLE test ADD( job VARCHAR(9));
DESC test;

--ALTER TABLE ~ RENAME �÷�
--�÷� �̸� ����
ALTER TABLE ���̺��̸� RENAME COLUMN ����_�÷�_�̸� to �ٲ�_�÷�_�̸�;
ALTER TABLE test RENAME COLUMN job to jobjob;
DESC test;

--ALTER TABLE~MODIFY �÷�
--�÷� Ÿ�� ����
ALTER TABLE ���̺��̸� MODIFY (�÷� �ٲ�Ÿ��);
ALTER TABLE test MODIFY (jobjob VARCHAR2(128));
DESC test;

SELECT * FROM emp;
ALTER TABLE emp MODIFY comm NUMBER DEFAULT 0;

--ALTER TABLE~DROP �÷�
DESC test;
ALTER TABLE ���̺��̸� DROP COLUMN �÷��̸�;
ALTER TABLE test DROP COLUMN jobjob;

-- �������� �̸� ����
ALTER TABLE ���̺��̸� RENAME CONSTRAINT �����������Ǹ� to �ٲ��������Ǹ�;
--�������� ����
ALTER TABLE ���̺��̸� DROP CONSTRAINT �������Ǹ�;

ALTER TABLE ����_���̺�_�̸� RENAME TO ���ο�_���̺�_�̸�;
DESC test;
ALTER TABLE test RENAME TO test_test;
SELECT*FROM test;
SELECT*FROM test_test;

SELECT * FROM bank_account;
TRUNCATE TABLE bank_account;
--truncate :: rollback �ȵ�.
--delete���� ������. delete�� rollback����.

--�ε���
--�ε����� ������ �˻��ӵ��� ��� �ִ�. �˻��� ����.

SELECT * FROM user_info;
CREATE UNIQUE INDEX user_info_eamil_uq_index ON user_info(email);

--�ε�����ȸ
SELECT * FROM user_indexes
WHERE table_name = 'USER_INFO';


--��
--������ ���̺�

--������***********
CREATE SEQUENCE seq_empno
START WITH 1000
INCREMENT BY 1
CACHE 20;

SELECT seq_empno.nextval FROM dual;
SELECT * FROM emp ORDER BY empno DESC;

DESC emp;
INSERT INTO emp(empno, ename) VALUES (seq_empno.nextval, 'abc');
SELECT * FROM emp;

DROP SEQUENCE seq_empno;

