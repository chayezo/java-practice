DROP USER test01 CASCADE;
CREATE USER test01 IDENTIFIED BY 1234;
--����� ����.
SELECT * FROM DBA_USERS WHERE username = 'TEST01';
--�빮��~~~~

GRANT CONNECT, RESOURCE TO test01;
--role �ο�.
CONN test01/1234;
--����.
CONN sys/12345 AS SYSDBA;
--������ �������� ����.
DROP USER test01 CASCADE;
--����� ����.

--ROLE.
������ ����. ������ �ο��� ȸ���� ���� �ϰ���.
CREATE ROLE manager_role;
--Ŀ���� role ����
GRANT create session, create table TO manager_role;
--���� �ο�
CREATE USER test01 IDENTIFIED TO 1234;
--����ڸ� �����ؼ� �ռ� ������ Ŀ���� ���� �ο���.
GRANT manager_role TO test01;

CONN test01/1234;
CONN sys/12345 AS SYSDBA;
GRANT create session TO test01;
REVOKE manager_role FROM test01;
--REVOKE :: ���� ȸ��.

--���Ǿ�~~~~ ��Ī
���Ǿ�� ������ ���̽� ��ü�� ���� ��Ī.
SELECT 1 FROM sys.dual;
SELECT 1 FROM dual;


--�������Ǿ�
-- 0. Ȥ�� �𸣴� ����������
DROP USER test01 CASCADE;
DROP USER test02 CASCADE;
SHOW USER;

CONN sys/12345 AS SYSDBA; --������ �������� ����.
-- 1. ����� ���� ���� + ���� �ο�
CREATE USER test01 IDENTIFIED BY 1234;
CREATE USER test02 IDENTIFIED BY 1234;
GRANT CONNECT, RESOURCE TO test01, test02;

-- 3. ���� ���Ǿ �����ϰ� test01���� �ο�����
DROP PUBLIC SYNONYM def_public;
CREATE PUBLIC SYNONYM def_public FOR test02.def;
GRANT SELECT
    ON test02.def
TO test01;


-- 2. test02 �������� �����ؼ� abc��� ���̺��� �ϳ� ������� (����)
CREATE TABLE def(
    id NUMBER PRIMARY KEY
);



-- 1.
CREATE SYNONYM test02_abc FOR test02.abc;
SELECT * FROM test02_abc;



CREATE USER test04 IDENTIFIED BY 1234;
--TEST02�� ������ ��� ������ �ȵ�.


SELECT * FROM emp;
--���Ѻο� �ް� ���డ��.

GRANT SELECT, INSERT
    ON emp,
    TO PUBLIC
WITH GRANT OPTION;








--����
--����ڿ��� ���� �ο�
GRANT
    CREATE USER,    --����� ����
    ALTER USER,     --����� ����
    DROP USER       --����� ����
TO test01 
WITH ADMIN OPTION;

-- ����ڷκ��� ���� ȸ��
REVOKE
    DROP USER
FROM test01;

GRANT
    ALTER USER,
    DROP USER
TO test01
WITH ADMIN OPTION;
--���� �ο����ش�. �� �Ŀ� test01���� alter, drop ����.

--��ü ����
alter - ��ü ����;


CREATE PUBLIC SYNONYM emp FOR emp;
GRANT SELECT ON emp TO PUBLIC;  --SELECT ���� �ο�

--��ü���� ȸ��
REVOKE INSERT ON emp FROM PUBLIC; -- �μ�Ʈ ���� ȸ��

SELECT INSTRB('abcdef', 'e') FROM dual;

SELECT * FROM def_public;



CREATE USER test03 IDENTIFIED BY 1234;
ALTER USER test03 IDENTIFIED BY 1234;
DROP USER test03;
--�ý��۰������� ���� �ο� �ް� �� �ڿ� ������ ����������.
