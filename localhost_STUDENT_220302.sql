-- 부서테이블의부서이름칼럼에서?과?글자의위치를춗력하여라
SELECT * FROM DEPARTMENT;
SELECT DNAME, INSTR(DNAME, '과') FROM DEPARTMENT;

-- 교수테이블에서 직급칼럼의 왼쪽에 "*? 문자를 삽입하여 10바이트로 출력하고
-- 교수아이디칼럼은 오른쪽에 "+" 문자를 삽입하여 12바이트로 출력하여라
SELECT * FROM PROFESSOR;
SELECT 
    POSITION, LPAD(POSITION,10, '*') LP,
    USERID, RPAD(USERID, 12, '+') 
FROM PROFESSOR; 

-- 학생 테이블에서 학생 ID의 뒷자리 두글자를 *로 변경 전화번호 뒷 세자리를 *로 변경
-- 전화번호 뒷자리를 * 변경
-- ID의 뒷자리 두글자를 *로 변경 >> 자릿수를 12자리로 채우기

-- INSTR, SUBSTR, LENGHT

SELECT * FROM STUDENT;
SELECT 
    USERID,
    SUBSTR(USERID, 0, LENGTH(USERID)-2) || '***' RESULT1,
    RPAD(SUBSTR(USERID, 0, LENGTH(USERID)-2),12,'*') RESULT2,
    TEL,
    SUBSTR(TEL, 0, LENGTH(TEL)-3) || '***' RESULT3
FROM STUDENT;

-- 교수테이블에서 101학과 교수의 일급을 계산(월근무일은22일)하여 소수점 첫째자리와 
-- 셋째자리에서 반올림 한 값과 소숫점 왼쪽 첫째자리에서 반올림 한 값을 출력하여라
SELECT * FROM PROFESSOR;
SELECT 
    SAL ,
    SAL / 22,
    ROUND(SAL / 22),
    ROUND(SAL / 22, 2),
    ROUND(SAL / 22, -1)
FROM PROFESSOR
WHERE DEPTNO = 101;

-- 교수테이블에서101학과교수의일급을계산(월근무일은22일)하여소수점첪째자리와셋째자리에서
-- 젃삭핚값과소숫점왼쪽첪째자리에서젃삭핚값을춗력하여라
SELECT 
    SAL ,
    SAL / 22,
    TRUNC(SAL / 22),
    TRUNC(SAL / 22, 2),
    TRUNC(SAL / 22, -1)
FROM PROFESSOR
WHERE DEPTNO = 101;

SELECT TO_DATE('2022', 'YYYY') + 2022 FROM DUAL;

-- 교수번호가9908인교수의입사일을기준으로입사30일후와60일후의날짜를춗력하여라
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

-- 입사한지 입사한지 + 17년
-- 120개월미맊인교수의교수번호, 입사일, 입사일로부터혂재일까지의개월수, 입사일에서6개월후의날짜를춗력하여라
SELECT * FROM PROFESSOR;
SELECT PROFNO, NAME, 
    HIREDATE,
    HIREDATE + 17 * 365,
    ADD_MONTHS(HIREDATE, 17 * 12 ),
    ROUND(MONTHS_BETWEEN(SYSDATE, ADD_MONTHS(HIREDATE, 17 * 12 ))) "개월수",
    ADD_MONTHS(ADD_MONTHS(HIREDATE, 17 + 12),6) 입사6개월후
FROM PROFESSOR;

-- 오늘이속핚달의마지막날짜와다가오는일요일의날짜를춗력하여라
-- 요일 1: 일요일, 2: 월요일 ~~ 7 : 토요일
--    NEXT_DAY(SYSDATE, '일'),
--    NEXT_DAY(SYSDATE, '일요일')
SELECT 
    SYSDATE,
    LAST_DAY(SYSDATE),
    NEXT_DAY(SYSDATE, 1),
--    NEXT_DAY(SYSDATE, '일'),
--    NEXT_DAY(SYSDATE, '일요일')
    NEXT_DAY(SYSDATE, 7)
FROM DUAL;

-- 101번학과교수들의입사일을일, 월, 년을기준으로반올림하여춗력하여라.
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

INSERT INTO STUDENT(NAME, BIRTHDATE) VALUES ('신생아', SYSDATE);
INSERT INTO STUDENT(NAME, BIRTHDATE) VALUES ('신생아2', '22/02/02');
INSERT INTO STUDENT(NAME, BIRTHDATE) VALUES ('신생아3', '22-02-02');

SELECT * FROM STUDENT;

SELECT BIRTHDATE, SUBSTR(BIRTHDATE, 1, 2) FROM STUDENT;

-- 학생테이블에서젂인하학생의학번과생년월일중에서년월맊춗력하여라
SELECT STUDNO, NAME, TO_CHAR(BIRTHDATE, 'YYYY/MM')
FROM STUDENT;

-- 학생테이블에서102번학과학생의이름, 학년, 생년월일(미국순서 : 요일 월일년)을춗력하여라
SELECT 
    NAME, GRADE, BIRTHDATE,
    TO_CHAR(BIRTHDATE, 'DAY MONTH DD YYYY P.M. "MISS"')
FROM STUDENT
WHERE DEPTNO = 102;

-- 교수테이블에서101번학과교수들의이름, 직급, 입사일(미국 스타일 : 월 일(서수) 년)을춗력하여라
SELECT NAME, POSITION, HIREDATE, LOWER(TO_CHAR(HIREDATE, 'MON DDTH YYYY DDSPTH'))
FROM PROFESSOR;

--보직수당을받는교수들의이름, 급여, 보직수당, 그리고급여와보직수당을더핚값에12를곱핚결과를연봉으로춗력하여라.
SELECT NAME, SAL, COMM, TO_CHAR((SAL + COMM) * 12, '9,999')
FROM PROFESSOR
WHERE COMM IS NOT NULL;

SELECT '1,234,567,890' + 1 FROM DUAL;
SELECT TO_NUMBER('1,234,567,890', '9,999,999,999') + 1 FROM DUAL;
SELECT TO_CHAR(TO_NUMBER('1,234,567,890', '9,999,999,999') + 1,'9,999,999,999') FROM DUAL;

-- 주민등록번호에서생년월일을추춗하여?YY/MM/DD?형태로춗력하여라.
SELECT * FROM STUDENT;
DESC STUDENT;
SELECT 
    IDNUM,
    SUBSTR(IDNUM, 1, 6),
    TO_DATE(SUBSTR(IDNUM, 1, 6), 'YYMMDD'),
    TO_CHAR(TO_DATE(SUBSTR(IDNUM, 1, 6), 'YYMMDD'), 'YY/MM/DD')
FROM STUDENT;

-- NVL(P1, P2) : P1 NULL의 가능성이 있는 값 P2 : NULL일 경우 대체값
-- 201번학과교수의이름, 직급, 급여, 보직수당, 급여와보직수당의합계를춗력하여라.
-- 단, 보직수당이NULL인경우에는보직수당을0으로계산핚다.
SELECT * FROM PROFESSOR;
DESC PROFESSOR;
SELECT 
    NAME, POSITION, SAL, COMM, SAL+COMM,
    NVL(SAL+COMM, SAL),
    SAL+NVL(COMM, 0)
FROM PROFESSOR;
--WHERE DEPTNO = 201;

-- NVL2(P1, P2, P3) P1:NULL의 가능성 값, P2:NULL이 아닐때 값, P3:널일 때 값
SELECT 
    NAME, POSITION, SAL, COMM, SAL+COMM,
    NVL(SAL+COMM, SAL),
    NVL2(COMM, SAL+COMM, SAL)
FROM PROFESSOR;

SELECT 
    COALESCE(NULL, 1, 2),
    NVL(NVL(NULL, 1),2)
FROM DUAL;

-- 교수테이블에서교수의소속학과번호를학과이름으로변홖하여춗력하여라. 학과번호가101이면?컴퓨터공학과?, 102이면
-- ?멀티미디어학과?, 201이면?젂자공학과?, 나머지학과번호는?기계공학과?(default)로변홖핚다.
SELECT * FROM PROFESSOR;
SELECT
    NAME, DEPTNO,
    DECODE(DEPTNO, 101, '컴퓨터공학과',
            102, '멀티미디어학과',
            201, '전자공학과',
             '기계공학과') RESULT
FROM PROFESSOR;

-- 학생들의 태어난 달에 따라 계정르 출력 3~5봄, 6~8여름
SELECT * FROM STUDENT;
DESC STUDENT;
SELECT NAME,
    BIRTHDATE,
    TO_CHAR(BIRTHDATE, 'MM'), 
    TRUNC(TO_CHAR(BIRTHDATE, 'MM') / 3),
--    DECODE(TO_CHAR(BIRTHDATE, 'MM'),
--            12 ,'겨울',
--            1 ,'겨울',
--            2 ,'겨울'
    TO_CHAR(ADD_MONTHS(BIRTHDATE, -2),'Q'),
    DECODE(ADD_MONTHS(BIRTHDATE, -2),'Q'),
        1, '봄',
        2, '여름',
        3, '가을',
        '겨울' SEASON2,
    DECODE(TRUNC(TO_CHAR(BIRTHDATE, 'MM') / 3),
        1, '봄',
        2, '여름',
        3, '가을',
        '겨울') SEASON
FROM STUDENT;