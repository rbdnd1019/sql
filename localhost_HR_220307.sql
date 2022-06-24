SELECT * FROM EMPLOYEES;

-- ���, �̸�, ��, �����, ��� ��ȸ
SELECT E1.EMPLOYEE_ID, E1.FIRST_NAME, E1.LAST_NAME, E1.MANAGER_ID, E1.SALARY  -- ����
, e2.employee_id, e2.first_name, e2.last_name, e2.manager_id, e2.salary -- ��粨
, e3.employee_id, e3.first_name, e3.last_name, e3.manager_id, e3.salary -- ����� ���
FROM EMPLOYEES E1, EMPLOYEES E2, EMPLOYEES E3
WHERE E1.MANAGER_ID = E2.EMPLOYEE_ID(+)
AND E2.MANAGER_ID = E3.EMPLOYEE_ID(+)
ORDER BY 1;

SELECT E1.EMPLOYEE_ID, E1.FIRST_NAME, E1.LAST_NAME, E1.MANAGER_ID, E1.SALARY  -- ����
, e2.employee_id, e2.first_name, e2.last_name, e2.manager_id, e2.salary -- ��粨
, e3.employee_id, e3.first_name, e3.last_name, e3.manager_id, e3.salary -- ����� ���
FROM EMPLOYEES E1
LEFT JOIN EMPLOYEES E2 ON E1.MANAGER_ID = E2.EMPLOYEE_ID
LEFT JOIN EMPLOYEES E3 ON E2.MANAGER_ID = E3.EMPLOYEE_ID
ORDER BY 1;

SELECT 1 + 2 * (3 + 4) FROM DUAL;


