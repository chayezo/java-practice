SELECT * FROM emp
ORDER BY ename DESC;
--DESC ::
SELECT count(*) as ��ü�ళ�� FROM emp;
SELECT * FROM emp
WHERE ename = 'WARD';
--��ҹ��� ���� : ���̺��̳� Į�� �̸��� �ҹ��ڷ� �ϸ� ������ ������.
--�Ϲ������� Ű����� �빮�ڷ� �Է��Ѵ�.
--�ٸ� ��� �ܾ�, �� ���̺� �̸�, ���̸��� �ҹ��ڷ� �Է��� ����.
SELECT length(ename) As �̸����� FROM emp;
--AS + Į�� ��Ī
SELECT * FROM tab;
SHOW user;
DESC emp;
--������ Į��, �������� ��ȸ ����.

SELECT DISTINCT deptno FROM emp;
SELECT DISTINCT job FROM emp;
--DISTINCT  �ߺ� ����
SELECT ename, sal AS ����, sal * 12 AS ���� FROM emp;
SELECT * FROM emp WHERE sal >= 1500;
SELECT * FROM emp WHERE comm > 500;

SELECT * FROM emp WHERE deptno <> 30;
SELECT * FROM emp WHERE deptno != 30;
SELECT * FROM emp WHERE NOT deptno = 30;
-- !=, <> ����

SELECT * FROM emp
WHERE
    job = 'SALESMAN'
        AND
    comm >= 300;
    
SELECT * FROM emp WHERE deptno IN (20, 30);
--(List) (a,b) 

SELECT * FROM emp 
WHERE empno BETWEEN 7698 AND 7902;
--���� ���� ��.
SELECT * FROM emp 
WHERE empno >=7698 AND empno <=7902;


--like ::���ڿ� �˻�
SELECT * FROM emp WHERE ename LIKE 'AL%';
SELECT * FROM emp WHERE ename LIKE '_A%';
--�̸��� �ι�° ���ĺ��� a ���Ե� ���
SELECT * FROM emp WHERE ename NOT LIKE '%A%';
--�̸��� A ���Ե��� ���� ���

--IS NULL
SELECT * FROM emp WHERE comm IS NULL;
SELECT * FROM emp WHERE NOT comm IS NULL;

--ORDER BY
--������ ���� ������. ���������� ���� ���������� ���̸� ��.
SELECT * FROM emp WHERE NOT comm IS NULL
ORDER BY ename DESC;
--���� �������� ������ ASC(��������). >default
--NULL�� :: ASC - ���� ������. DESC - ������� ���.

SELECT ename, sal FROM emp ORDER BY sal DESC, ename ASC;

SELECT ename, sal AS ���� FROM emp ORDER BY ���� DESC;
--������.
--��Ī���� ���� �ϸ� ""����ؾ� �ϱ� ������ _��� ��õ.

SELECT ename || '''s JOB is' || job AS EMPLOYEE FROM emp;
--String employee = ename + 's JOB IS' + job

SELECT 20 * 30 FROM dual;
SELECT mod(5, 4) FROM dual;
SELECT -10, ABS(10) FROM dual;
SELECT 3.141592, ROUND(3.141592) FROM dual;
SELECT 12.3344, TRUNC(12.3344, -1) FROM dual;
SELECT CEIL(12.3456) FROM dual;
SELECT FLOOR(12.3456) FROM dual;

SELECT LOWER(UPPER('sam')) FROM dual;
SELECT LOWER('SAM') FROM dual;
SELECT INITCAP('kim mal ddong') FROM dual;
--�ձ��ڸ� �빮��.
SELECT INITCAP(ename) FROM emp;

--length :: ���ڿ� ����
SELECT LENGTH('test11'), LENGTHB('test11') FROM dual;
SELECT LENGTH('�ѱ�'), LENGTHB('�ѱ�') FROM dual;

SELECT INSTR('ORACLE WELCOME', 'C') FROM dual;
--���ʷ� ���� ���ڿ� ã�Ƽ� ���.
SELECT SUBSTR('����Ŭ �����ͺ��̽�',3, 4)FROM dual;

SELECT LPAD('ORACLE', 10, '*') FROM dual;
--LPAD ::���ʺ��� ä���. RPAD ::�����ʺ��� ä���.

SELECT 'ORACLE', ltrim ('   ORACLE'), rtrim('ORACLE') FROM dual;
SELECT TRIM('a' FROM 'aaaOracleaaa') FROM dual;

SELECT SYSDATE FROM dual;
SELECT add_months(SYSDATE, 2) FROM dual;
SELECT next_day(sysdate, '��') FROM dual;
SELECT last_day(sysdate) FROM dual;

SELECT ename, nvl(comm, 0) comm FROM emp;
--nvl([��/�÷�], ����Ұ�)
SELECT * FROM emp;
SELECT ename, nvl2(comm, sal + comm, sal) as pay, sal, comm FROM emp;
--����õ.

--NULLIF
SELECT NULLIF(10, 10) FROM dual;
SELECT NULLIF('A', 'B') FROM dual;

--DECODE
SELECT DECODE(100, 100, 'EQUAL', 'UNEQUAL') FROM dual;
SELECT DECODE(100, 150, 'EQUAL', 'UNEQUAL') FROM dual;

SELECT empno, ename, deptno,
DECODE(deptno, 10, 'ȸ����', 20, '������', 30, '������', 40, '���') deptname
FROM emp;

SELECT * FROM emp e 
JOIN dept d ON e.deptno = d.deptno;
SELECT e.empno, e.ename,e. deptno, 
FROM emp e ;

SELECT
    ename,
    CASE
        WHEN deptno = 10 THEN 'ȸ����'
        WHEN deptno = 20 THEN '������'
        WHEN deptno = 30 THEN '������'
        WHEN deptno = 40 THEN '���'
        ELSE '������'
    END
FROM emp;

SELECT count(*), count(comm), count(empno) FROM emp;
SELECT count(*) FROM emp;   --���� ���.
SELECT
    *
FROM emp WHERE NOT comm IS NULL;

SELECT sum(sal) FROM emp;
SELECT round(avg(sal),2) FROM emp;

SELCET sum(sal)/count(*) FROM emp;

SELECT max(sal) FROM emp;
SELECT min(sal) FROM emp;

--�׷�ȭ
SELECT job, round(avg(sal), 2) AS avgsal
FROM emp GROUP BY job
ORDER BY avgsal DESC;

SELECT * FROM dept;
SELECT * FROM emp;

SELECT job, count(job) as �ο�
FROM emp e JOIN dept d ON e.deptno = d.deptno
GROUP BY job
ORDER BY �ο� DESC;

SELECT * FROM
FROM emp e JOIN dept d ON e.deptno = d.deptno;

SELECT d.loc, count(*) AS ������
FROM emp e
JOIN dept d ON e.deptno = d.deptno
GROUP BY d.loc
ORDER BY ������ DESC;
-- =����
SELECT loc, count(loc) as �ο�
FROM emp e JOIN dept d ON e.deptno = d.deptno
GROUP BY loc
ORDER BY �ο� DESC;
