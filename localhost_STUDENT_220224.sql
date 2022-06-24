SELECT * FROM STUDENT;

-- �л� ���̺��� �й�, �̸�, �а���ȣ�� ��ȸ�Ͻÿ�
SELECT STUDNO, NAME , DEPTNO FROM STUDENT;

-- �ߺ��� ī��Ʈ�Ҷ� ���� ��������
SELECT 
    DEPTNO,
    NAME 
FROM
    STUDENT 
WHERE
    deptno != 101
    AND 1=1
ORDER BY 1 ;

-- �л����̺��� �а��� �ο����� ��ȸ
SELECT DEPTNO, COUNT(*)
FROM STUDENT
GROUP BY DEPTNO  -- �а��� �ο����� ����
HAVING COUNT(*) >= 5;

SELECT * FROM STUDENT;
--�л����̺����ߺ��Ǵ��а���ȣ(deptno)�������ϰ�t���Ͽ���
SELECT DISTINCT DEPTNO FROM STUDENT;
--�л����̺����ߺ��Ǵ��а���ȣ, �г������ϰ�t���Ͽ���
SELECT DEPTNO, GRADE FROM STUDENT ORDER BY 1 DESC, 2;

-- �����ͺ��̽� ���ڿ� ���͸� : '' �� �̰� �����

-- HELLO WORLD�� ����Ͻÿ�
SELECT 'HELLO WORLD' FROM STUDENT;

-- �л��� �̸��� '�ȳ�'����
SELECT NAME || ' �ȳ�' FROM STUDENT;

SELECT CONCAT(NAME, ' �ȳ�') AS HI FROM STUDENT ;  -- �÷������� AS�� �ʼ��� �ƴ�

-- �й��� "�й�" �̸����� "�̸�"�� �ο��� ��Ī���� �й�,�̸� ��ȸ
SELECT STUDNO "�й�", NAME "�̸�" FROM STUDENT;

-- �μ����̺����μ��̸�Į���Ǻ�����dept_name, �μ���ȣĮ���Ǻ�����DN���κο��Ͽ��t���Ͽ���
SELECT * FROM department;
SELECT DNAME, DEPTNO FROM department;
SELECT DNAME "dept_name", DEPTNO "DN" FROM department;

-- �л����̺����й����̸�Į���������Ͽ���Student����º��������ϳ���Į��ó�������Ͽ��t���Ͽ���
SELECT * FROM STUDENT;
SELECT STUDNO, NAME FROM student;
SELECT STUDNO || ' ' || NAME "STUDENT" FROM student;

-- �л��Ǹ����Ը�pound���Q���ϰ�Į���̸���?weight_pound?��º������έt���Ͽ���. 1kg��2.2pound�̴�.
SELECT * FROM STUDENT;
SELECT STUDNO,NAME, WEIGHT FROM STUDENT;
SELECT NAME, WEIGHT, WEIGHT * 2.2 || 'POUND' "weight_pound"  FROM STUDENT;

/* 
SELECT
FROM
WHERE
GROUP BY
HAVING
ORDER BY
�� ���� ������ �߿���!!!!!!!!!!!!!!!!!!!!!
*/


SELECT DEPTNO, COUNT(*)
FROM STUDENT
WHERE WEIGHT IS NOT NULL
GROUP BY DEPTNO
HAVING COUNT(DEPTNO) >= 5
ORDER BY DEPTNO;

-- ���� �߻� ���� 
-- FROM >> HAVING >> GROUP BY >> WHERE >> SELECT >> ORDER BY  �� ������ �ٸ� �� ����

DROP TABLE EX_TYPE;
CREATE TABLE EX_TYPE (
    C CHAR(10),
    V VARCHAR(10)
);

INSERT INTO EX_TYPE VALUES ('sql', 'sql');
SELECT * FROM EX_TYPE;


SELECT *
FROM EX_TYPE
WHERE C = 'sql';

SELECT *
FROM EX_TYPE
WHERE V = 'sql';

SELECT *
FROM EX_TYPE
WHERE C = 'sql      ';

SELECT *
FROM EX_TYPE
WHERE V = 'sql      ';


SELECT *
FROM EX_TYPE
WHERE C = V;

SELECT 1 
FROM DUAL
WHERE 1 = '1';

SELECT 3.14 + 1 FROM DUAL;

SELECT STUDNO, NAME, BIRTHDATE, SYSDATE, ROUND(SYSDATE - BIRTHDATE)
FROM STUDENT
WHERE STUDNO = 10101;

SELECT SYSDATE - TO_DATE('92/10/19') FROM DUAL;

SELECT 
    TO_CHAR(SYSDATE , 'YY/MM/DD HH24:MI:SS') NOW,
    TO_CHAR(SYSDATE + 1, 'YY/MM/DD HH24:MI:SS') "1DAY_AFTER",
    TO_CHAR(SYSDATE + 3 / 24, 'YY/MM/DD HH24:MI:SS') "3 HOURS AFTER",
    TO_CHAR(SYSDATE + 30 / 24/ 60, 'YY/MM/DD HH24:MI:SS') "30MINUTE AFTER",
    TO_CHAR(SYSDATE + 0.5, 'YY/MM/DD HH24:MI:SS') "12HOUR AFTER",
    TO_CHAR(SYSDATE + 50 / 24/ 60, 'YY/MM/DD HH24:MI:SS'),
    ADD_MONTHS(SYSDATE, -1)
FROM DUAL;

SELECT
    TO_CHAR(TO_DATE('92/10/19'),'YY/MM/DD HH24:MI:SS') 
FROM DUAL;

SELECT ROUND(SYSDATE-1/24, 'MM') FROM DUAL;

SELECT ROWID,ROWNUM, S.* FROM STUDENT S ORDER BY STUDNO DESC;
