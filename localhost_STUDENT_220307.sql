SELECT S.DEPTNO, S.NAME, GRADE, STUDNO, PROFNO, P.NAME, POSITION
FROM STUDENT S
FULL JOIN PROFESSOR P USING(PROFNO);

SELECT * 
FROM PROFESSOR
WHERE POSITION = '교수';

-- 사용자아이디가?jun123?인학생과같은학년인학생의학번, 이름, 학년을춗력하여라단일행비교연산자
SELECT STUDNO, NAME, GRADE
FROM STUDENT
WHERE GRADE =
(SELECT GRADE
FROM STUDENT
WHERE USERID = 'jun123');

-- 101번학과학생들의평균몸무게보다몸무게가적은학생의이름, 학과번호, 몸무게를 출력하여라
SELECT NAME, DEPTNO, WEIGHT
FROM STUDENT
WHERE WEIGHT <
(SELECT AVG(WEIGHT)
FROM STUDENT
WHERE DEPTNO = 101);

-- 20101번학생과학년이같고, 키는20101번학생보다큰학생의이름, 학년, 키를 출력하여라
SELECT GRADE
FROM STUDENT
WHERE STUDNO = 20101;

SELECT HEIGHT
FROM STUDENT
WHERE STUDNO = 20101;

SELECT NAME, GRADE, HEIGHT
FROM STUDENT
WHERE 
    GRADE = (
        SELECT GRADE
        FROM STUDENT
        WHERE STUDNO = 20101
        )
AND 
    HEIGHT > (
        SELECT HEIGHT
        FROM STUDENT
        WHERE STUDNO = 20101
        );
        
SELECT * FROM DEPARTMENT
WHERE COLLEGE = 100;

-- 정보미디어학부(부서번호:100)에소속된모든학생의학번, 이름, 학과번호를춗력하여라
SELECT DEPTNO
FROM DEPARTMENT
WHERE COLLEGE = (
    SELECT DEPTNO
    FROM DEPARTMENT
    WHERE DNAME = '정보미디어학부'
);

SELECT STUDNO, NAME, DEPTNO
FROM STUDENT
WHERE DEPTNO IN(
    SELECT DEPTNO
    FROM DEPARTMENT
    WHERE COLLEGE = (
        SELECT DEPTNO
        FROM DEPARTMENT
        WHERE DNAME = '정보미디어학부'
    )
);

-- 모든학생중에서 4학년 학생중에서 키가제일작은학생보다키가큰학생의학번, 이름, 키를춗력하여라

SELECT STUDNO, NAME, HEIGHT
FROM STUDENT
WHERE HEIGHT > ANY(
    SELECT HEIGHT 
    FROM STUDENT
    WHERE GRADE = 4);


SELECT STUDNO, NAME, HEIGHT
FROM STUDENT
WHERE HEIGHT > (
SELECT MIN(HEIGHT)
FROM STUDENT
WHERE GRADE = 4);


-- 모든학생중에서4학년학생중에서키가제일 큰 학생보다키가큰학생의학번, 이름, 키를춗력하여라
SELECT STUDNO, NAME, HEIGHT
FROM STUDENT
WHERE HEIGHT > ALL(
    SELECT HEIGHT 
    FROM STUDENT
    WHERE GRADE = 4
    );

SELECT STUDNO, NAME, HEIGHT
FROM STUDENT
WHERE HEIGHT > (
SELECT MAX(HEIGHT)
FROM STUDENT
WHERE GRADE = 4);

-- 모든학생중에서4학년학생중에서키가제일 큰학생보다 키가 작은 학생의학번, 이름, 키를춗력하여라
SELECT STUDNO, NAME, HEIGHT
FROM STUDENT
WHERE HEIGHT < ANY (
    SELECT HEIGHT 
    FROM STUDENT
    WHERE GRADE = 4);
    
SELECT STUDNO, NAME, HEIGHT
FROM STUDENT
WHERE HEIGHT < (
    SELECT MAX(HEIGHT)
    FROM STUDENT
    WHERE GRADE = 4);
    
-- 보직수당을받는교수가핚명이라도있으면모든교수의교수번호, 이름, 보직수당그리고급여와보직수당의합을춗력하여라
SELECT PROFNO, NAME, COMM, SAL+COMM
FROM PROFESSOR
WHERE EXISTS
(SELECT *
FROM PROFESSOR
WHERE COMM IS NOT NULL);

-- PAIRWISE 비교방법에의해학년별로몸무게가최소인학생의이름, 학년, 몸무게를춗력하여라.
SELECT NAME, GRADE, WEIGHT
FROM STUDENT
WHERE (GRADE, WEIGHT) IN (
SELECT GRADE, MIN(WEIGHT)
FROM STUDENT
GROUP BY GRADE);

-- UNPAIRWISE 비교방법에의해학년별로몸무게가최소인학생의이름, 학년, 몸무게를춗력하여라.

SELECT NAME, GRADE, WEIGHT
FROM STUDENT
WHERE GRADE IN(
    SELECT GRADE
    FROM STUDENT
    GROUP BY GRADE)
AND WEIGHT IN(
    SELECT MIN(WEIGHT)
    FROM STUDENT
    GROUP BY GRADE
)
ORDER BY 2;

-- 각 학과학생의 평균키보다 키가 큰 학생의이름, 학과번호, 키를 출력하여라
SELECT DEPTNO, AVG(HEIGHT)
FROM STUDENT
GROUP BY DEPTNO;

SELECT STUDNO, NAME, DEPTNO, HEIGHT
FROM STUDENT S1
WHERE HEIGHT > (
    SELECT AVG(HEIGHT)
    FROM STUDENT S2
    WHERE S1.DEPTNO = S2.DEPTNO
GROUP BY DEPTNO);

-- 학번, 이름, 학과번호, 학과이름을 조인, 서브쿼리
-- 조인
SELECT STUDNO, NAME, DEPTNO, DNAME
FROM STUDENT
JOIN DEPARTMENT USING(DEPTNO);

-- 서브쿼리
SELECT STUDNO, NAME, S.DEPTNO, (SELECT DNAME FROM DEPARTMENT D WHERE D.DEPTNO = S.DEPTNO) DNAME
FROM STUDENT S;

SELECT STUDNO, NAME, PROFNO, (SELECT NAME FROM PROFESSOR P WHERE P.PROFNO = S.PROFNO) PNAME
, (SELECT DNAME FROM DEPARTMENT D WHERE D.DEPTNO = S.DEPTNO) DNAME
FROM STUDENT S;


-- DDL, DML, DCL
-- D는 DATA, L은 LANGUAGE
-- DDL : DATA DEFINITION LANGUAGE 데이터 정의어
-- CREATE, ALTER, DROP, TRUNCATE, REPLACE, ... (테이블를 만들때)

-- DML : DATA MANUFACTIUAL LANGUAGE 테이터 조작어
-- INSERT, UPDATE, DELETE, MERGE, ...(테이블 내의 조작어)

-- DCL : DATA CONTROL LANGUAGE 테이터 제어어
-- COMMIT, ROLLBACK, SAVEPOINT, GRANT, REVOKE, ... (기타 등등...)
-- >> TCL 

INSERT INTO STUDENT
VALUES (10110, '홍길동', 'hong', '1',
'8501011143098', '85/01/01', '041)630-3114',
170, 70, 101, 9903);

SELECT * FROM STUDENT;

ROLLBACK;

COMMIT;
