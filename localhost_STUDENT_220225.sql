-- �л����̺���1�г��л����˻��Ͽ��й�, �̸�, �а���ȣ���t���Ͽ���
SELECT * FROM STUDENT;
SELECT STUDNO, NAME, GRADE, DEPTNO FROM STUDENT;
SELECT STUDNO, NAME, DEPTNO FROM STUDENT
WHERE GRADE = '1';  
-- GRADE�� ����Ÿ�� 1�� �����ε� �ڵ����� ����ȯ ����, 
-- ������ ��Ȯ�ϰ� �ϴ°� ����

DESC STUDENT;

-- �л����̺��������԰�70kg �������л����˻��Ͽ��й�, �̸�, �г�, �а���ȣ, �����Ը��t���Ͽ���.
SELECT * FROM STUDENT;
SELECT STUDNO, NAME, GRADE, DEPTNO, WEIGHT FROM STUDENT
WHERE WEIGHT <= 70 ;

-- �л����̺���1�г��̸鼭�����԰�70kg �̻����л����˻��Ͽ��̸�, �г�, ������, �а���ȣ���t���Ͽ���.
SELECT * FROM STUDENT;
SELECT NAME, GRADE, WEIGHT, DEPTNO FROM STUDENT;
SELECT NAME, GRADE, WEIGHT, DEPTNO FROM STUDENT 
WHERE GRADE = '1'
AND WEIGHT >= 70;

-- �л����̺���1�г��̰ų������԰�70kg �̻����л����˻��Ͽ��̸�, �г�, ������, �а���ȣ���t���Ͽ���.
SELECT NAME, GRADE, WEIGHT, DEPTNO FROM STUDENT 
WHERE GRADE = '1'
OR WEIGHT >= 70;

-- �л����̺����а���ȣ��?101?�̾ƈ��л����й����̸����а���ȣ���t���ض�
SELECT DEPTNO FROM STUDENT
WHERE DEPTNO != 101;

-- BETWEEN �����ڸ�����Ͽ������԰�50kg����70kg �������л����й�, �̸�, �����Ը��t���Ͽ���.
SELECT * FROM STUDENT;
SELECT STUDNO, NAME, WEIGHT FROM STUDENT
WHERE WEIGHT BETWEEN 50 AND 70;

-- �л����̺���81�⿡��83�⵵���¾�л����̸����������������ض�
SELECT * FROM STUDENT;
SELECT BIRTHDATE, NAME FROM STUDENT
WHERE TO_CHAR(BIRTHDATE, 'YY') IN (81, 82, 83);
-- WHERE TO_CHAR(BIRTHDATE, 'YY') BETWEEN 81 AND 83;
-- WHERE BIRTHDATE BETWEEN '81/01/01' AND '83/12/31';

-- IN �����ڸ� ����Ͽ� 102���а��� 201���а� �л����̸�, �г�, �а���ȣ�� ����Ͽ���
SELECT * FROM STUDENT;
SELECT NAME, GRADE, DEPTNO FROM STUDENT
WHERE DEPTNO NOT IN  ('102','201');

-- �л����̺�������?��?�����л����̸�, �г�, �а���ȣ���t���Ͽ���.
SELECT * FROM STUDENT;
SELECT NAME, GRADE, DEPTNO FROM STUDENT
WHERE NAME LIKE '��%';

-- �̸� �߿� '��'�� ���� �л��� �й�, �̸� ��ȸ
SELECT * FROM STUDENT;
SELECT STUDNO, NAME FROM STUDENT
WHERE NAME LIKE '%��%';

INSERT INTO STUDENT(NAME) VALUES ('������');

SELECT * FROM PROFESSOR;
SELECT AVG(SAL) FROM PROFESSOR;
SELECT POSITION, AVG(SAL) FROM PROFESSOR GROUP BY POSITION;



