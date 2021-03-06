-- 10개씩 출력하게 만들기 (페이징)
SELECT ROWNUM, EMPLOYEE_ID, FIRST_NAME, LAST_NAME
FROM employees
WHERE ROWNUM <= 20
AND ROWNUM > 10;

-- SUB QUERY 를 활용한 페이지
-- 3페이지 10개씩
SELECT RN, ID, FN, LN FROM (
    SELECT ROWNUM RN , EMPLOYEE_ID ID, FIRST_NAME FN, LAST_NAME LN
    FROM employees
    WHERE ROWNUM <= 3 * 10
)
WHERE RN > (3-1) * 10;

-- 3페이지 보고 5개씩
SELECT RN, ID, FN, LN FROM (
    SELECT ROWNUM RN , EMPLOYEE_ID ID, FIRST_NAME FN, LAST_NAME LN
    FROM employees
    WHERE ROWNUM <= 3 * 5
)
WHERE RN > (3 - 1) * 5;
