-- 학생테이블에서중복되는학과번호(deptno)를제외하고춗력하여라
SELECT DISTINCT DEPTNO FROM STUDENT;

-- 부서테이블에서부서이름칼럼의별명은dept_name, 부서번호칼럼의별명은DN으로부여하여춗력하여라
SELECT DNAME DEPT_NAME, DEPTNO 부서번호 FROM DEPARTMENT;

-- 부서테이블에서부서이름칼럼의별명은“Department Name”, 부서번호칼럼의별명은“부서번호#”으로부여하여춗력하여라
SELECT DNAME "DEPARTMENT NAME", DEPTNO "부서번호" FROM DEPARTMENT;

-- 학생테이블에서학번과이름칼럼을연결하여“Student”라는별명으로하나의칼럼처럼연결하여춗력하여라
SELECT STUDNO || ' ' || NAME STUDENT FROM STUDENT;

-- 학생의몸무게를pound로홖산하고칼럼이름을?weight_pound?라는별명으로춗력하여라. 1kg은2.2pound이다.
SELECT NAME, WEIGHT, WEIGHT * 2.2 || 'POUND' WEIGHT_POUND FROM STUDENT;

-- 학생테이블에서1학년학생맊검색하여학번, 이름, 학과번호를춗력하여라
SELECT STUDNO, NAME, DEPTNO 
FROM STUDENT
WHERE GRADE = 1;

-- 학생테이블에서몸무게가70kg 이하인학생맊검색하여학번, 이름, 학년, 학과번호, 몸무게를춗력하여라.
SELECT STUDNO, NAME, GRADE, DEPTNO, WEIGHT 
FROM STUDENT
WHERE WEIGHT <= 70;

-- 학생테이블에서1학년이면서몸무게가70kg 이상인학생맊검색하여이름, 학년, 몸무게, 학과번호를춗력하여라.
SELECT NAME, GRADE, WEIGHT, DEPTNO
FROM STUDENT
WHERE GRADE = 1
AND WEIGHT >= 70;

-- BETWEEN 연산자를사용하여몸무게가50kg에서70kg 사이인학생의학번, 이름, 몸무게를춗력하여라.
SELECT DEPTNO, NAME, WEIGHT
FROM STUDENT
WHERE WEIGHT BETWEEN 50 AND 70;