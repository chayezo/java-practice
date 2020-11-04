SELECT * FROM emp
ORDER BY ename DESC;
--DESC ::
SELECT count(*) as 전체행개수 FROM emp;
SELECT * FROM emp
WHERE ename = 'WARD';
--대소문자 구분 : 테이블이나 칼럼 이름은 소문자로 하면 가독성 좋아짐.
--일반적으로 키워드는 대문자로 입력한다.
--다른 모든 단어, 즉 테이블 이름, 열이름은 소문자로 입력을 권장.
SELECT length(ename) As 이름길이 FROM emp;
--AS + 칼럼 별칭
SELECT * FROM tab;
SHOW user;
DESC emp;
--각각의 칼럼, 제약조건 조회 가능.

SELECT DISTINCT deptno FROM emp;
SELECT DISTINCT job FROM emp;
--DISTINCT  중복 제거
SELECT ename, sal AS 월급, sal * 12 AS 연봉 FROM emp;
SELECT * FROM emp WHERE sal >= 1500;
SELECT * FROM emp WHERE comm > 500;

SELECT * FROM emp WHERE deptno <> 30;
SELECT * FROM emp WHERE deptno != 30;
SELECT * FROM emp WHERE NOT deptno = 30;
-- !=, <> 같음

SELECT * FROM emp
WHERE
    job = 'SALESMAN'
        AND
    comm >= 300;
    
SELECT * FROM emp WHERE deptno IN (20, 30);
--(List) (a,b) 

SELECT * FROM emp 
WHERE empno BETWEEN 7698 AND 7902;
--상하 같은 값.
SELECT * FROM emp 
WHERE empno >=7698 AND empno <=7902;


--like ::문자열 검색
SELECT * FROM emp WHERE ename LIKE 'AL%';
SELECT * FROM emp WHERE ename LIKE '_A%';
--이름의 두번째 알파벳에 a 포함된 사람
SELECT * FROM emp WHERE ename NOT LIKE '%A%';
--이름에 A 포함되지 않은 사람

--IS NULL
SELECT * FROM emp WHERE comm IS NULL;
SELECT * FROM emp WHERE NOT comm IS NULL;

--ORDER BY
--문장의 가장 마지막. 습관적으로 제일 마지막으로 붙이면 됨.
SELECT * FROM emp WHERE NOT comm IS NULL
ORDER BY ename DESC;
--따로 지정하지 않으면 ASC(오름차순). >default
--NULL값 :: ASC - 가장 마지막. DESC - 가장먼저 출력.

SELECT ename, sal FROM emp ORDER BY sal DESC, ename ASC;

SELECT ename, sal AS 월급 FROM emp ORDER BY 월급 DESC;
--직관적.
--별칭에서 띄어쓰기 하면 ""사용해야 하기 때문에 _사용 추천.

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
--앞글자만 대문자.
SELECT INITCAP(ename) FROM emp;

--length :: 문자열 길이
SELECT LENGTH('test11'), LENGTHB('test11') FROM dual;
SELECT LENGTH('한글'), LENGTHB('한글') FROM dual;

SELECT INSTR('ORACLE WELCOME', 'C') FROM dual;
--최초로 오는 문자열 찾아서 출력.
SELECT SUBSTR('오라클 데이터베이스',3, 4)FROM dual;

SELECT LPAD('ORACLE', 10, '*') FROM dual;
--LPAD ::왼쪽부터 채우기. RPAD ::오른쪽부터 채우기.

SELECT 'ORACLE', ltrim ('   ORACLE'), rtrim('ORACLE') FROM dual;
SELECT TRIM('a' FROM 'aaaOracleaaa') FROM dual;

SELECT SYSDATE FROM dual;
SELECT add_months(SYSDATE, 2) FROM dual;
SELECT next_day(sysdate, '금') FROM dual;
SELECT last_day(sysdate) FROM dual;

SELECT ename, nvl(comm, 0) comm FROM emp;
--nvl([값/컬럼], 출력할값)
SELECT * FROM emp;
SELECT ename, nvl2(comm, sal + comm, sal) as pay, sal, comm FROM emp;
--비추천.

--NULLIF
SELECT NULLIF(10, 10) FROM dual;
SELECT NULLIF('A', 'B') FROM dual;

--DECODE
SELECT DECODE(100, 100, 'EQUAL', 'UNEQUAL') FROM dual;
SELECT DECODE(100, 150, 'EQUAL', 'UNEQUAL') FROM dual;

SELECT empno, ename, deptno,
DECODE(deptno, 10, '회계팀', 20, '개발팀', 30, '영업팀', 40, '운영팀') deptname
FROM emp;

SELECT * FROM emp e 
JOIN dept d ON e.deptno = d.deptno;
SELECT e.empno, e.ename,e. deptno, 
FROM emp e ;

SELECT
    ename,
    CASE
        WHEN deptno = 10 THEN '회계팀'
        WHEN deptno = 20 THEN '개발팀'
        WHEN deptno = 30 THEN '영업팀'
        WHEN deptno = 40 THEN '운영팀'
        ELSE '팀없음'
    END
FROM emp;

SELECT count(*), count(comm), count(empno) FROM emp;
SELECT count(*) FROM emp;   --많이 사용.
SELECT
    *
FROM emp WHERE NOT comm IS NULL;

SELECT sum(sal) FROM emp;
SELECT round(avg(sal),2) FROM emp;

SELCET sum(sal)/count(*) FROM emp;

SELECT max(sal) FROM emp;
SELECT min(sal) FROM emp;

--그룹화
SELECT job, round(avg(sal), 2) AS avgsal
FROM emp GROUP BY job
ORDER BY avgsal DESC;

SELECT * FROM dept;
SELECT * FROM emp;

SELECT job, count(job) as 인원
FROM emp e JOIN dept d ON e.deptno = d.deptno
GROUP BY job
ORDER BY 인원 DESC;

SELECT * FROM
FROM emp e JOIN dept d ON e.deptno = d.deptno;

SELECT d.loc, count(*) AS 직원수
FROM emp e
JOIN dept d ON e.deptno = d.deptno
GROUP BY d.loc
ORDER BY 직원수 DESC;
-- =같음
SELECT loc, count(loc) as 인원
FROM emp e JOIN dept d ON e.deptno = d.deptno
GROUP BY loc
ORDER BY 인원 DESC;
