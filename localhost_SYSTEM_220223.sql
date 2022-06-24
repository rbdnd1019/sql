SELECT * FROM TAB;
-- 계정 / 권한

-- 계정 생성
CREATE USER STUDENT IDENTIFIED BY 1234;

-- 권한 부여
GRANT CONNECT, RESOURCE TO STUDENT;


-- HR 계정 LOCK 해제 및 비밀번호 변경
ALTER USER HR IDENTIFIED BY 1234 ACCOUNT UNLOCK ;

-- 응용 SW 기초기술 활용
--1. 운영체제  2. 데이터베이스  3. 네트워크  4. 환경설정