SELECT * FROM STUDENT;

-- �л��� Ű ���� ���� ����
SELECT * FROM STUDENT ORDER BY HEIGHT DESC;

-- �л����� �ο���, ���Ű, ��� ������
--SELECT COUNT(*), AVG(HEIGHT), AVG(WEIGHT) FROM STUDENT;

SELECT * FROM PROFESSOR;
SELECT * FROM DEPARTMENT;
SELECT * FROM SALGRADE;

SELECT 'HELLO WORLD' FROM DUAL;

-- �л��� �й�, �̸�, �а��̸��� ��ȸ
SELECT STUDNO, NAME, DNAME
FROM STUDENT
NATURAL JOIN DEPARTMENT;
-- ���� ����
SELECT STUDNO, NAME, (SELECT DNAME FROM DEPARTMENT D WHERE D.DEPTNO = S.DEPTNO) AS DNAME
FROM STUDENT S;


-- ���� ������ �����ͺ��̽� ������ ������ ��� ���̺� �̸��� Ȯ���Ͽ���
SELECT * FROM TAB;

-- �л����̺�(student)�Ǳ�����Ȯ���Ͽ���
DESC STUDENT;

SELECT SYSDATE -3 FROM DUAL;

SELECT 1000 * 200 FROM DUAL;

SELECT * FROM DUAL;

-- �μ����̺��� �μ��̸�(dname)�� �μ���ȣ(deptno)�� ����Ͽ���
SELECT DNAME, DEPTNO FROM DEPARTMENT;


/*
�� ���α׷��� >>
����Ʈ ������ JS, JSP, JAVA
�鿣�� ������ JAVA, DB

DB : ��Ȯ�� �ð��� ���

JOIN, SBUQUERY, AGGREGATE

*/