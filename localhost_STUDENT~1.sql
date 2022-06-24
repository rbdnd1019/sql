-- �л����̺����ߺ��Ǵ��а���ȣ(deptno)�������ϰ�t���Ͽ���
SELECT DISTINCT DEPTNO FROM STUDENT;

-- �μ����̺����μ��̸�Į���Ǻ�����dept_name, �μ���ȣĮ���Ǻ�����DN���κο��Ͽ��t���Ͽ���
SELECT DNAME DEPT_NAME, DEPTNO �μ���ȣ FROM DEPARTMENT;

-- �μ����̺����μ��̸�Į���Ǻ�������Department Name��, �μ���ȣĮ���Ǻ��������μ���ȣ#�����κο��Ͽ��t���Ͽ���
SELECT DNAME "DEPARTMENT NAME", DEPTNO "�μ���ȣ" FROM DEPARTMENT;

-- �л����̺����й����̸�Į���������Ͽ���Student����º��������ϳ���Į��ó�������Ͽ��t���Ͽ���
SELECT STUDNO || ' ' || NAME STUDENT FROM STUDENT;

-- �л��Ǹ����Ը�pound���Q���ϰ�Į���̸���?weight_pound?��º������έt���Ͽ���. 1kg��2.2pound�̴�.
SELECT NAME, WEIGHT, WEIGHT * 2.2 || 'POUND' WEIGHT_POUND FROM STUDENT;

-- �л����̺���1�г��л����˻��Ͽ��й�, �̸�, �а���ȣ���t���Ͽ���
SELECT STUDNO, NAME, DEPTNO 
FROM STUDENT
WHERE GRADE = 1;

-- �л����̺��������԰�70kg �������л����˻��Ͽ��й�, �̸�, �г�, �а���ȣ, �����Ը��t���Ͽ���.
SELECT STUDNO, NAME, GRADE, DEPTNO, WEIGHT 
FROM STUDENT
WHERE WEIGHT <= 70;

-- �л����̺���1�г��̸鼭�����԰�70kg �̻����л����˻��Ͽ��̸�, �г�, ������, �а���ȣ���t���Ͽ���.
SELECT NAME, GRADE, WEIGHT, DEPTNO
FROM STUDENT
WHERE GRADE = 1
AND WEIGHT >= 70;

-- BETWEEN �����ڸ�����Ͽ������԰�50kg����70kg �������л����й�, �̸�, �����Ը��t���Ͽ���.
SELECT DEPTNO, NAME, WEIGHT
FROM STUDENT
WHERE WEIGHT BETWEEN 50 AND 70;