-- �μ����̺��Ǻμ��̸�Į������?��?��������ġ���t���Ͽ���
SELECT * FROM DEPARTMENT;
SELECT DNAME, INSTR(DNAME, '��') FROM DEPARTMENT;

-- �������̺��� ����Į���� ���ʿ� "*? ���ڸ� �����Ͽ� 10����Ʈ�� ����ϰ�
-- �������̵�Į���� �����ʿ� "+" ���ڸ� �����Ͽ� 12����Ʈ�� ����Ͽ���
SELECT * FROM PROFESSOR;
SELECT 
    POSITION, LPAD(POSITION,10, '*') LP,
    USERID, RPAD(USERID, 12, '+') 
FROM PROFESSOR; 

-- �л� ���̺��� �л� ID�� ���ڸ� �α��ڸ� *�� ���� ��ȭ��ȣ �� ���ڸ��� *�� ����
-- ��ȭ��ȣ ���ڸ��� * ����
-- ID�� ���ڸ� �α��ڸ� *�� ���� >> �ڸ����� 12�ڸ��� ä���

-- INSTR, SUBSTR, LENGHT

SELECT * FROM STUDENT;
SELECT 
    USERID,
    SUBSTR(USERID, 0, LENGTH(USERID)-2) || '***' RESULT1,
    RPAD(SUBSTR(USERID, 0, LENGTH(USERID)-2),12,'*') RESULT2,
    TEL,
    SUBSTR(TEL, 0, LENGTH(TEL)-3) || '***' RESULT3
FROM STUDENT;

-- �������̺��� 101�а� ������ �ϱ��� ���(���ٹ�����22��)�Ͽ� �Ҽ��� ù°�ڸ��� 
-- ��°�ڸ����� �ݿø� �� ���� �Ҽ��� ���� ù°�ڸ����� �ݿø� �� ���� ����Ͽ���
SELECT * FROM PROFESSOR;
SELECT 
    SAL ,
    SAL / 22,
    ROUND(SAL / 22),
    ROUND(SAL / 22, 2),
    ROUND(SAL / 22, -1)
FROM PROFESSOR
WHERE DEPTNO = 101;

-- �������̺���101�а��������ϱ������(���ٹ�����22��)�Ͽ��Ҽ����Q°�ڸ��ͼ�°�ڸ�����
-- �����������Ҽ������ʫQ°�ڸ����������������t���Ͽ���
SELECT 
    SAL ,
    SAL / 22,
    TRUNC(SAL / 22),
    TRUNC(SAL / 22, 2),
    TRUNC(SAL / 22, -1)
FROM PROFESSOR
WHERE DEPTNO = 101;

SELECT TO_DATE('2022', 'YYYY') + 2022 FROM DUAL;

-- ������ȣ��9908�α������Ի��������������Ի�30���Ŀ�60�����ǳ�¥���t���Ͽ���
SELECT * FROM PROFESSOR;
DESC PROFESSOR;

SELECT 
    PROFNO, 
    NAME, 
    HIREDATE,
    HIREDATE + 30,
    HIREDATE + 60
FROM PROFESSOR
WHERE PROFNO = 9908;

SELECT SYSDATE() FROM DUAL;

-- �Ի����� �Ի����� + 17��
-- 120�����̐��α����Ǳ�����ȣ, �Ի���, �Ի��Ϸκ����n���ϱ����ǰ�����, �Ի��Ͽ���6�������ǳ�¥���t���Ͽ���
SELECT * FROM PROFESSOR;
SELECT PROFNO, NAME, 
    HIREDATE,
    HIREDATE + 17 * 365,
    ADD_MONTHS(HIREDATE, 17 * 12 ),
    ROUND(MONTHS_BETWEEN(SYSDATE, ADD_MONTHS(HIREDATE, 17 * 12 ))) "������",
    ADD_MONTHS(ADD_MONTHS(HIREDATE, 17 + 12),6) �Ի�6������
FROM PROFESSOR;

-- �����̼������Ǹ�������¥�ʹٰ������Ͽ����ǳ�¥���t���Ͽ���
-- ���� 1: �Ͽ���, 2: ������ ~~ 7 : �����
--    NEXT_DAY(SYSDATE, '��'),
--    NEXT_DAY(SYSDATE, '�Ͽ���')
SELECT 
    SYSDATE,
    LAST_DAY(SYSDATE),
    NEXT_DAY(SYSDATE, 1),
--    NEXT_DAY(SYSDATE, '��'),
--    NEXT_DAY(SYSDATE, '�Ͽ���')
    NEXT_DAY(SYSDATE, 7)
FROM DUAL;

-- 101���а����������Ի�������, ��, �����������ιݿø��Ͽ��t���Ͽ���.
SELECT * FROM PROFESSOR;
SELECT
    PROFNO,
    HIREDATE,
    TO_CHAR(HIREDATE, 'YYYY/MM/DD HH24:MI:SS') R1,
    TO_CHAR(ROUND(HIREDATE, 'HH24'), 'YYYY/MM/DD HH24:MI:SS') R2,
    TO_CHAR(ROUND(HIREDATE, 'DD'), 'YYYY/MM/DD HH24:MI:SS') R3,
    TO_CHAR(ROUND(HIREDATE, 'MM'), 'YYYY/MM/DD HH24:MI:SS')R4, 
    TO_CHAR(ROUND(HIREDATE, 'YY'), 'YYYY/MM/DD HH24:MI:SS')R5
FROM PROFESSOR
WHERE DEPTNO = 101;

SELECT '22-02-02' -1 FROM DUAL;

INSERT INTO STUDENT(NAME, BIRTHDATE) VALUES ('�Ż���', SYSDATE);
INSERT INTO STUDENT(NAME, BIRTHDATE) VALUES ('�Ż���2', '22/02/02');
INSERT INTO STUDENT(NAME, BIRTHDATE) VALUES ('�Ż���3', '22-02-02');

SELECT * FROM STUDENT;

SELECT BIRTHDATE, SUBSTR(BIRTHDATE, 1, 2) FROM STUDENT;

-- �л����̺����������л����й�����������߿���������t���Ͽ���
SELECT STUDNO, NAME, TO_CHAR(BIRTHDATE, 'YYYY/MM')
FROM STUDENT;

-- �л����̺���102���а��л����̸�, �г�, �������(�̱����� : ���� ���ϳ�)���t���Ͽ���
SELECT 
    NAME, GRADE, BIRTHDATE,
    TO_CHAR(BIRTHDATE, 'DAY MONTH DD YYYY P.M. "MISS"')
FROM STUDENT
WHERE DEPTNO = 102;

-- �������̺���101���а����������̸�, ����, �Ի���(�̱� ��Ÿ�� : �� ��(����) ��)���t���Ͽ���
SELECT NAME, POSITION, HIREDATE, LOWER(TO_CHAR(HIREDATE, 'MON DDTH YYYY DDSPTH'))
FROM PROFESSOR;

--�����������޴±��������̸�, �޿�, ��������, �׸���޿��ͺ�����������������12������������������έt���Ͽ���.
SELECT NAME, SAL, COMM, TO_CHAR((SAL + COMM) * 12, '9,999')
FROM PROFESSOR
WHERE COMM IS NOT NULL;

SELECT '1,234,567,890' + 1 FROM DUAL;
SELECT TO_NUMBER('1,234,567,890', '9,999,999,999') + 1 FROM DUAL;
SELECT TO_CHAR(TO_NUMBER('1,234,567,890', '9,999,999,999') + 1,'9,999,999,999') FROM DUAL;

-- �ֹε�Ϲ�ȣ��������������߭t�Ͽ�?YY/MM/DD?���·έt���Ͽ���.
SELECT * FROM STUDENT;
DESC STUDENT;
SELECT 
    IDNUM,
    SUBSTR(IDNUM, 1, 6),
    TO_DATE(SUBSTR(IDNUM, 1, 6), 'YYMMDD'),
    TO_CHAR(TO_DATE(SUBSTR(IDNUM, 1, 6), 'YYMMDD'), 'YY/MM/DD')
FROM STUDENT;

-- NVL(P1, P2) : P1 NULL�� ���ɼ��� �ִ� �� P2 : NULL�� ��� ��ü��
-- 201���а��������̸�, ����, �޿�, ��������, �޿��ͺ����������հ踦�t���Ͽ���.
-- ��, ����������NULL�ΰ�쿡�º���������0���ΰ������.
SELECT * FROM PROFESSOR;
DESC PROFESSOR;
SELECT 
    NAME, POSITION, SAL, COMM, SAL+COMM,
    NVL(SAL+COMM, SAL),
    SAL+NVL(COMM, 0)
FROM PROFESSOR;
--WHERE DEPTNO = 201;

-- NVL2(P1, P2, P3) P1:NULL�� ���ɼ� ��, P2:NULL�� �ƴҶ� ��, P3:���� �� ��
SELECT 
    NAME, POSITION, SAL, COMM, SAL+COMM,
    NVL(SAL+COMM, SAL),
    NVL2(COMM, SAL+COMM, SAL)
FROM PROFESSOR;

SELECT 
    COALESCE(NULL, 1, 2),
    NVL(NVL(NULL, 1),2)
FROM DUAL;

-- �������̺��������ǼҼ��а���ȣ���а��̸����κ��Q�Ͽ��t���Ͽ���. �а���ȣ��101�̸�?��ǻ�Ͱ��а�?, 102�̸�
-- ?��Ƽ�̵���а�?, 201�̸�?���ڰ��а�?, �������а���ȣ��?�����а�?(default)�κ��Q����.
SELECT * FROM PROFESSOR;
SELECT
    NAME, DEPTNO,
    DECODE(DEPTNO, 101, '��ǻ�Ͱ��а�',
            102, '��Ƽ�̵���а�',
            201, '���ڰ��а�',
             '�����а�') RESULT
FROM PROFESSOR;

-- �л����� �¾ �޿� ���� ������ ��� 3~5��, 6~8����
SELECT * FROM STUDENT;
DESC STUDENT;
SELECT NAME,
    BIRTHDATE,
    TO_CHAR(BIRTHDATE, 'MM'), 
    TRUNC(TO_CHAR(BIRTHDATE, 'MM') / 3),
--    DECODE(TO_CHAR(BIRTHDATE, 'MM'),
--            12 ,'�ܿ�',
--            1 ,'�ܿ�',
--            2 ,'�ܿ�'
    TO_CHAR(ADD_MONTHS(BIRTHDATE, -2),'Q'),
    DECODE(ADD_MONTHS(BIRTHDATE, -2),'Q'),
        1, '��',
        2, '����',
        3, '����',
        '�ܿ�' SEASON2,
    DECODE(TRUNC(TO_CHAR(BIRTHDATE, 'MM') / 3),
        1, '��',
        2, '����',
        3, '����',
        '�ܿ�') SEASON
FROM STUDENT;