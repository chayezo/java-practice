SELECT*FROM emp;
SELECT empno, ename, job, sal,
RANK() OVER(ORDER BY sal DESC) 급여순위
FROM emp;

SELECT RANK(50) WITHIN GROUP (ORDER BY sal DESC) AS 순위
FROM emp;

SELECT ename, deptno, sal,
    RANK() OVER (ORDER BY sal DESC) "순위1",
        DENSE_RANK() OVER (ORDER BY sal DESC) "순위2",
        DENSE_RANK() OVER (PARTITION BY deptno ORDER BY sal DESC) "순위3"
    FROM emp
ORDER BY 순위1;

SELECT * FROM (
    SELECT ename, sal, RANK() OVER (ORDER BY sal DESC) 순위 FROM emp)
    WHERE 순위 <= 5;
SELECT * FROM (
    SELECT ename, sal, RANK() OVER (ORDER BY sal DESC) 순위 FROM emp)
    WHERE 순위 = 9;
    
--CUME_DIST()
SELECT ename, sal, ROUND(CUME_DIST() OVER (ORDER BY sal), 1) 누적분산
FROM emp
WHERE deptno = 30;

--NTILE()
-- :: 급여를 5등급으로 분류
SELECT ename, sal,
    NTILE(5) OVER(ORDER BY sal DESC ) 등급
FROM emp;

--ROW_NUMBER()
--ORACLE에서 /*ROWNUM과는 관계없음
SELECT empno, ename, sal, hiredate,
    ROW_NUMBER() OVER (ORDER BY sal DESC, hiredate ASC) 순번
FROM emp;



--집계함수
SELECT deptno, SUM(sal) s_sal
FROM emp
GROUP BY deptno ORDER BY s_sal DESC;

SELECT empno, sal,
SUM(sal) OVER (PARTITION BY deptno ORDER BY empno ROWS BETWEEN UNBOUNDED 
PRECEDING AND UNBOUNDED FOLLOWING) "win1",
-- rows : 부분그룹인 윈도우의 크기를 물리적인 단위로 행집합을 지정
-- unbounded preceding : 윈도우의 첫행
-- unbounded following : 윈도우의 마지막행
SUM(sal) OVER (PARTITION BY deptno ORDER BY empno ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) "win2",
-- 윈도우의 시작행에서 현재 위치(current row) 까지의 합계를 구해서 win2에
SUM(sal) OVER (PARTITION BY deptno ORDER BY empno ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) "win3"
-- 현재 위치에서 윈도우의 마지막행까지의 합계를 구해서 win3에
FROM emp
WHERE deptno = 30;

SELECT empno, sal,
SUM(sal) OVER (PARTITION BY deptno
ORDER BY empno
ROWS BETWEEN 1 PRECEDING
AND 1 FOLLOWING) "win1",
-- 1 preceding and 1 following
-- 현재 행을 중심으로 이전행과 다음행의 급여합계
SUM(sal) OVER (PARTITION BY deptno ORDER BY empno
ROWS BETWEEN 1 PRECEDING AND
CURRENT ROW) "win2",
-- 1 preceding and current row
-- 이전행과 현재행의 급여 합계
SUM(sal) OVER (PARTITION BY deptno ORDER BY empno
ROWS BETWEEN CURRENT ROW AND
1 FOLLOWING) "win3"
-- current row and 1 following
-- 현재 행과 다음행의 합계
FROM emp
WHERE deptno = 30;

--RATIO_TO_REPORT
SELECT ename, sal,
    LPAD(TRUNC(RATIO_TO_REPORT(sal) OVER() * 100, 0), 5) || '%' 비율,
    TO_CHAR(TRUNC(RATIO_TO_REPORT(sal) OVER() * 20000000, 0), 'L00,999,999') "추가로 받게될 급여"
FROM emp;

--Lag(조회할 범위, 이전위치, 기준 현재위치)
SELECT ename, deptno, sal,
LAG(sal, 1, 0) OVER (ORDER BY sal) 이전값,
-- 1 : 위의 행값, 0 : 이전행이 없으면 0 처리함
LAG(sal, 1, sal) OVER (ORDER BY sal) "조회2",
-- 이전행이 없으면 현재 행의 값을 출력
LAG(sal, 1, sal) OVER (PARTITION BY deptno ORDER BY sal) "조회3"
-- 부서 그룹안에서의 이전 행값 출력
FROM emp;


SELECT ename, deptno, sal,
    LEAD(sal, 1, 0) OVER (ORDER BY sal DESC) 다음값
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

--비등가조인
SELECT * FROM salgrade;
SELECT * FROM emp;

SELECT e.ename, e.sal, s.grade
FROM emp e, salgrade s
WHERE e.sal
    BETWEEN s.losal AND s.hisal;

SELECT e.ename, e.sal, s.grade
FROM emp e
    JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal;
    
--SELF JOIN :: 자가조인
--계층 구조 표현할 때 유리하다.
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
--카테시안 곱
SELECT * FROM emp, dept;
SELECT count(*) FROM emp;
SELECT count(*) FROM dept;

SELECT *
FROM emp e
RIGHT JOIN dept d ON e.deptno = d.deptno;

SELECT * FROM emp e
JOIN dept d
USING (DEPTNO);
--선생님은 ON 사용 선호.
--USING 장점: 직관적.
--USING 키워드에 제공되는 컬럼명은 테이블 별칭이 없는 형태여야 한다.
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

--서브쿼리
SELECT * FROM dept;

SELECT * FROM emp
WHERE deptno = (
    SELECT deptno FROM dept WHERE dname = 'ACCOUNTING'
); 
--()안에 있는게 서브쿼리.

SELECT * FROM emp 
WHERE sal >= (SELECT avg(sal) FROM emp);

SELECT * FROM emp
WHERE deptno IN (SELECT deptno FROM dept WHERE loc IN('NEW YORK', 'DALLAS'));
==IN(10, 20) -> 같은 결과


--부서별 급여를 제일 많이 받는 사원 조회
SELECT max(sal) FROM emp GROUP BY deptno; --서브쿼리

SELECT e.ename, d.dname, e.sal, d.deptno FROM emp e
JOIN dept d ON e.deptno = d.deptno
WHERE sal IN (SELECT max(sal) FROM emp GROUP BY deptno) ;
--1: 그룹별로 가장 높은 연봉을 출력
--SELECT max(sal) FROM emp GROUP BY deptno;
--2: emp, dept 조인(등가조인)
--3: where 조건절에 IN (2850, 3000, 5000)

--ANY연산자
SELECT empno, ename, job, sal
FROM emp
WHERE sal > ANY (SELECT sal FROM emp WHERE JOB = 'SALESMAN');
-- =같음
SELECT sal FROM emp WHERE sal > 1250 
ORDER BY sal DESC;

SELECT empno, ename, job, sal
FROM emp
WHERE sal = ANY (SELECT sal FROM emp WHERE JOB = 'SALESMAN');

--ALL연산자
SELECT * FROM emp WHERE sal > 1250;
SELECT * FROM emp WHERE sal > ALL (SELECT max(sal) FROM emp WHERE job = 'MANAGER');
SELECT max(sal) FROM emp WHERE job = 'MANAGER';

--EXISTS 연산자
SELECT empno, ename, sal
FROM emp e
WHERE EXISTS (SELECT empno FROM emp WHERE e.empno = mgr);
SELECT DISTINCT mgr FROM emp WHERE not mgr is null;
SELECT mgr FROM emp WHERE NOT mgr is null GROUP BY mgr; --3개 다 같음.

--다중 열 서브쿼리
SELECT empno, ename, sal, deptno
FROM emp
WHERE (deptno, sal) IN (SELECT deptno, sal FROM emp WHERE deptno = 30);

SELECT deptno, sal FROM emp WHERE deptno = 30;

--스칼라 서브쿼리
SELECT ename, deptno, sal,
-- 소속 부서의 급여 평균값 1개
(SELECT TRUNC(AVG(SAL)) FROM EMP
WHERE DEPTNO = E.DEPTNO) AS AVGDEPTSAL
FROM EMP E;

SELECT TRUNC(AVG(SAL)) FROM emp;

SELECT EMPNO, ENAME,
    CASE
        WHEN DEPTNO = (SELECT DEPTNO FROM DEPT WHERE LOC = 'NEW YORK') THEN 'hq'
        ELSE 'branch'
    END AS 소속
FROM EMP E ORDER BY 소속 DESC;


--상관 쿼리 :: 상호연관 서브쿼리
--메인 쿼리의 특정 컬럼을 조인 조건으로 사용하는 서브 쿼리.

SELECT ename, job,
(SELECT dname FROM dept WHERE deptno = e.deptno) dname
FROM emp e;
--위아래 같음 : 아래가 더 직관적~~~~
SELECT e.ename, e.job, d.dname
FROM emp e
JOIN dept d ON e.deptno = d.deptno;


SELECT dname FROM dept
WHERE deptno IN (SELECT deptno FROM emp e);
SELECT dname FROM dept
WHERE deptno = e.deptno;

--from절 서브쿼리
SELECT b.empno, b.ename, b.job, b.sal, b.deptno
FROM (
    SELECT empno FROM emp WHERE sal > (SELECT AVG(sal) FROM emp WHERE deptno = 20)
) a, emp b WHERE a.empno = b.empno AND b.mgr is NOT NULL AND b.deptno != 20;
--1:가장 안쪽에 있는 서브쿼리
SELECT AVG(sal) FROM emp WHERE deptno = 20;
--2:a
SELECT empno, ename FROM emp WHERE sal > (SELECT AVG(sal) FROM emp WHERE deptno = 20);
----순서대로 서브쿼리 분석해보기!*****

--ORDER BY절 서브쿼리
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
--집합연산자
SELECT empno, ename, JOB FROM emp WHERE JOB = 'SALESMAN'
UNION
SELECT empno, ename, JOB FROM emp WHERE JOB = 'MANAGER';
--== 위아래같음.
SELECT empno, ename, job FROM emp
WHERE job IN ('SALESMAN', 'MANAGER');

--INTERSECT
SELECT empno, ename, sal FROM emp WHERE sal > 1000
INTERSECT
SELECT empno, ename, sal FROM emp WHERE sal < 2000;

SELECT empno, ename, sal FROM emp WHERE sal > 1000 AND sal < 2000;


--MINUS::차집합
SELECT empno, ename, sal FROM emp
MINUS
SELECT empno, ename, sal FROM emp WHERE sal > 2000;

SELECT empno, ename, sal FROM emp WHERE sal <= 2000;

--DDL
--CREATE TABLE
DROP TABLE test_table;
CREATE TABLE test_table(
    id NUMBER,
    name VARCHAR2(128) CONSTRAINT test_table_nn NOT NULL, --컬럼 레벨
    CONSTRAINT test_table_pk PRIMARY KEY(id) --테이블 레벨
);
SELECT * FROM test_table;

SELECT  table_name FROM USER_TABLES WHERE table_name = 'TEST';

DESC test_table;
--ALTER TABLE 테이블 이름 ADD CONSTRAINT 제약조건이름 제약조건종류(칼럼이름);
--ALTER 유의사항 :: 중복되는 행이 발견되면 제약 조건 걸 수 없다.
ALTER TABLE 테이블이름 MODIFY (칼럼 NOT NULL);
ALTER TABLE 테이블이름 ADD CONSTRAINT 제약조건이름 제약조건종류(칼럼이름);

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

--제약조건확인
SELECT * FROM user_constraints WHERE table_name = 'BANK_ACCOUNT';
SELECT * FROM user_cons_columns WHERE table_name = 'BANK_ACCOUNT';

--ALTER TABLE
CREATE TABLE test AS( SELECT  empno, ename, sal FROM emp WHERE 1=0);
SELECT * FROM test;
--새 컬럼 추가하기
ALTER TABLE 테이블이름 ADD (컬럼 데이터타입);
ALTER TABLE test ADD( job VARCHAR(9));
DESC test;

--ALTER TABLE ~ RENAME 컬럼
--컬럼 이름 변경
ALTER TABLE 테이블이름 RENAME COLUMN 원래_컬럼_이름 to 바뀔_컬럼_이름;
ALTER TABLE test RENAME COLUMN job to jobjob;
DESC test;

--ALTER TABLE~MODIFY 컬럼
--컬럼 타입 변경
ALTER TABLE 테이블이름 MODIFY (컬럼 바꿀타입);
ALTER TABLE test MODIFY (jobjob VARCHAR2(128));
DESC test;

SELECT * FROM emp;
ALTER TABLE emp MODIFY comm NUMBER DEFAULT 0;

--ALTER TABLE~DROP 컬럼
DESC test;
ALTER TABLE 테이블이름 DROP COLUMN 컬럼이름;
ALTER TABLE test DROP COLUMN jobjob;

-- 제약조건 이름 변경
ALTER TABLE 테이블이름 RENAME CONSTRAINT 원래제약조건명 to 바꿀제약조건명;
--제약조건 제거
ALTER TABLE 테이블이름 DROP CONSTRAINT 제약조건명;

ALTER TABLE 기존_테이블_이름 RENAME TO 새로운_테이블_이름;
DESC test;
ALTER TABLE test RENAME TO test_test;
SELECT*FROM test;
SELECT*FROM test_test;

SELECT * FROM bank_account;
TRUNCATE TABLE bank_account;
--truncate :: rollback 안됨.
--delete와의 차이점. delete는 rollback가능.

--인덱스
--인덱스의 역할은 검색속도의 향상에 있다. 검색만 빠름.

SELECT * FROM user_info;
CREATE UNIQUE INDEX user_info_eamil_uq_index ON user_info(email);

--인덱스조회
SELECT * FROM user_indexes
WHERE table_name = 'USER_INFO';


--뷰
--가상의 테이블

--시퀀스***********
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

