SELECT * FROM TAB;
-- ���� / ����

-- ���� ����
CREATE USER STUDENT IDENTIFIED BY 1234;

-- ���� �ο�
GRANT CONNECT, RESOURCE TO STUDENT;


-- HR ���� LOCK ���� �� ��й�ȣ ����
ALTER USER HR IDENTIFIED BY 1234 ACCOUNT UNLOCK ;

-- ���� SW ���ʱ�� Ȱ��
--1. �ü��  2. �����ͺ��̽�  3. ��Ʈ��ũ  4. ȯ�漳��