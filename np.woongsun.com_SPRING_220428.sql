CREATE TABLE USERS(
    USERNAME VARCHAR2(50) PRIMARY KEY,
    PASSWORD VARCHAR2(50) NOT NULL,
    ENABLED CHAR(1) DEFAULT '1'
);

CREATE TABLE AUTHORITIES (
    USERNAME NOT NULL REFERENCES USERS(USERNAME),
    AUTHORITY VARCHAR2(50) NOT NULL
);

CREATE UNIQUE INDEX IX_AUTH_USERNAME ON AUTHORITIES (USERNAME, AUTHORITY);

INSERT INTO USERS VALUES ('user00', 'pw00', '1');
INSERT INTO USERS VALUES ('member00', 'pw00', '1');
INSERT INTO USERS VALUES ('admin00', 'pw00', '1');
INSERT INTO USERS VALUES ('javaman', '1234', '1');

INSERT INTO AUTHORITIES VALUES ('user00', 'ROLE_USER');
INSERT INTO AUTHORITIES VALUES ('member00', 'ROLE_MEMBER');
INSERT INTO AUTHORITIES VALUES ('admin00', 'ROLE_MANAGER');
INSERT INTO AUTHORITIES VALUES ('admin00', 'ROLE_ADMIN');
INSERT INTO AUTHORITIES VALUES ('javaman', 'ROLE_MANAGER');
INSERT INTO AUTHORITIES VALUES ('javaman', 'ROLE_ADMIN');
INSERT INTO AUTHORITIES VALUES ('javaman', 'ROLE_MEMBER');

DROP TABLE AUTHORITIES;
DROP TABLE USERS;

SELECT * FROM AUTHORITIES;
SELECT * FROM USERS;

CREATE TABLE TBL_MEMBER (
    USERID VARCHAR2(50) PRIMARY KEY,
    USERPW VARCHAR2(100) NOT NULL,
    USERNAME VARCHAR2(100) NOT NULL,
    REGDATE DATE DEFAULT SYSDATE,
    UPDATEDATE DATE DEFAULT SYSDATE,
    ENABLED CHAR(1) DEFAULT '1'
    );
    
CREATE TABLE TBL_MEMBER_AUTH (
    USERID REFERENCES TBL_MEMBER(USERID),
    AUTH VARCHAR2(50) NOT NULL
);

SELECT * FROM USERS;
SELECT USERID USERNAME, USERPW PASSWORD, ENABLED FROM TBL_MEMBER WHERE USERID = 'admin99';

SELECT USERID USERNAME, AUTH AUTHORITY FROM TBL_MEMBER_AUTH WHERE USERID = 'admin99';

SELECT * 
FROM TBL_MEMBER 
JOIN TBL_MEMBER_AUTH 
USING(USERID) 
WHERE USERID = 'admin99';

