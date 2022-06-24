SELECT * 
FROM TBL_MEMBER
JOIN TBL_MEMBER_AUTH
USING(ID)
WHERE ID = 'woong';

SELECT * FROM TBL_MEMBER_AUTH;

SELECT * FROM TBL_MEMBER;

UPDATE TBL_MEMBER SET
    TEL = '',
    NICKNAME = '¿õ¾²'
WHERE ID = 'woong';

alter table tbl_member drop column auth;
alter table tbl_member add auth number default 0;

DELETE TBL_MEMBER_AUTH WHERE ID = 'manager1';

DELETE TBL_MEMBER WHERE ID = 'manager1';



UPDATE TBL_MEMBER_AUTH SET
    AUTH = 'ROLE_ADMIN'
WHERE ID = 'bibibik123';