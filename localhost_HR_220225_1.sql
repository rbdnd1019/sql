-- 10���� ����ϰ� ����� (����¡)
SELECT ROWNUM, EMPLOYEE_ID, FIRST_NAME, LAST_NAME
FROM employees
WHERE ROWNUM <= 20
AND ROWNUM > 10;

-- SUB QUERY �� Ȱ���� ������
-- 3������ 10����
SELECT RN, ID, FN, LN FROM (
    SELECT ROWNUM RN , EMPLOYEE_ID ID, FIRST_NAME FN, LAST_NAME LN
    FROM employees
    WHERE ROWNUM <= 3 * 10
)
WHERE RN > (3-1) * 10;

-- 3������ ���� 5����
SELECT RN, ID, FN, LN FROM (
    SELECT ROWNUM RN , EMPLOYEE_ID ID, FIRST_NAME FN, LAST_NAME LN
    FROM employees
    WHERE ROWNUM <= 3 * 5
)
WHERE RN > (3 - 1) * 5;
