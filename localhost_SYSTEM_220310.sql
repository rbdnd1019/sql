-- VIEW 생성 권한, SYNONYM 생성 권한을 STUDENT계정에 부여
GRANT CREATE VIEW, CREATE SYNONYM TO STUDENT;

GRANT SELECT ON HR.EMPLOYEES TO STUDENT;