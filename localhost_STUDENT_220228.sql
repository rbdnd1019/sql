SELECT * FROM STUDENT;

SELECT * FROM PROFESSOR WHERE PROFNO = 9903;

-- '' ÀÌ°Ô ¹®ÀÚÀÇ ³Î
-- µðºñ¿¡¼­´Â '' = NULL Àº °°Àº °ª

SELECT
    SYSDATE,
    TO_CHAR(SYSDATE, 'MM/DD') MD,  -- µÎ°³ÀÇ ÀÎÀÚ°¡ ÀÖÀÚ¸¸ ÇÏ³ªÀÇ °ª¸¸ ³ª¿À´Â°Ô ½ºÄ®¶ó
    TO_CHAR(NULL, 'MM/DD') NV,
    TO_CHAR(SYSDATE, NULL) NV2
FROM DUAL;

SELECT AVG(MYVAL)
FROM (
    SELECT 1000 MYVAL FROM DUAL
    UNION ALL
    SELECT NULL FROM DUAL
    UNION ALL
    SELECT NULL FROM DUAL
    UNION ALL
    SELECT NULL FROM DUAL
    UNION ALL
    SELECT 2000 FROM DUAL
);

-- NULLÀÇ ¿¬»êÀÌ¶ó NULL
SELECT (1000 + NULL + NULL + NULL + 2000) / 5 FROM DUAL; 

SELECT 2 / 0 FROM DUAL;

-- ±³¼öÅ×ÀÌºí¿¡¼­ÀÌ¸§, Á÷±Þ, º¸Á÷¼ö´çÀ»­t·ÂÇÏ¿©¶óNULL
SELECT * FROM PROFESSOR;
SELECT NAME, POSITION, COMM 
FROM PROFESSOR;

-- ±³¼öÅ×ÀÌºí¿¡¼­ º¸Á÷¼ö´çÀ» ¹Ú´Â ±³¼öÀÇ ÀÌ¸§, Á÷±Þ, º¸Á÷¼ö´çÀ»­t·ÂÇÏ¿©¶óNULL
SELECT * FROM PROFESSOR;
SELECT NAME, POSITION, COMM
FROM PROFESSOR
WHERE COMM IS NOT NULL; 
-- WHERE COMM != NULL·Î ÇÒ °æ¿ì nullÀº°°À½('=') ¶Ç´Â°°Áö¾ÊÀ½('!=')À» ´Ù¸§°ª°ú ºñ±³ÇÏ°Å³ª ´Ù¸¥null°ú ºñ±³ÇÒ¼ö¾ø´Ù.


-- ±³¼öÅ×ÀÌºí¿¡¼­±Þ¿©¿¡º¸Á÷¼ö´çÀ» ´õÇÑ°ªÀºsal_comÀÌ¶ó´Âº°¸íÀ¸·Î­t·ÂÇÏ¿©¶ó.
SELECT * FROM PROFESSOR;
SELECT NAME, SAL, COMM, SAL+COMM sal_com FROM PROFESSOR;

-- 102¹øÇÐ°úÀÇÇÐ»ýÁß¿¡¼­1ÇÐ³â¶Ç´Â4ÇÐ³âÇÐ»ýÀÇÀÌ¸§, ÇÐ³â, ÇÐ°ú¹øÈ£¸¦­t·ÂÇÏ¿©¶ó.
SELECT * FROM STUDENT;
SELECT NAME, GRADE, DEPTNO FROM STUDENT;
SELECT NAME, GRADE, DEPTNO FROM STUDENT
WHERE DEPTNO = 102
AND (GRADE = 1
OR GRADE = 4);

-- 102¹øÇÐ°úÀÇÇÐ»ýÁß¿¡¼­4ÇÐ³âÇÐ»ýÀÌ°Å³ª¼Ò¼ÓÇÐ°ú¿¡»ó°ü¾øÀÌ1ÇÐ³âÇÐ»ýÀÇÀÌ¸§, ÇÐ³â, ÇÐ°ú¹øÈ£¸¦­t·ÂÇÏ¿©¶ó.
SELECT NAME, GRADE, DEPTNO FROM STUDENT
WHERE DEPTNO = 102
AND GRADE = 4
OR GRADE = 1;

-- 1ÇÐ³âÀÌ¸é¼­¸ö¹«°Ô°¡70kg ÀÌ»óÀÎÇÐ»ýÀÇÁýÇÕ(stud_heavy)°ú
-- 1ÇÐ³âÀÌ¸é¼­101¹øÇÐ°ú¿¡¼Ò¼ÓµÈÇÐ»ý(stud_101)À¸·Î±¸¼ºµÈµÎ°³ÀÇÅ×ÀÌºí»ý¼º¹Úµ¿£’,
CREATE TABLE STUD_HEAVY AS
SELECT * FROM STUDENT
WHERE GRADE = 1 AND WEIGHT >= 70;

CREATE TABLE STUD_101 AS
SELECT * FROM STUDENT
WHERE GRADE = 1 AND DEPTNO = 101;

SELECT * FROM STUD_HEAVY;
SELECT * FROM STUD_101;

SELECT STUDNO, NAME, DEPTNO, WEIGHT FROM STUD_HEAVY
UNION
SELECT STUDNO, NAME, DEPTNO, WEIGHT FROM STUD_101;

SELECT STUDNO, NAME, DEPTNO, WEIGHT FROM STUD_HEAVY
UNION ALL
SELECT STUDNO, NAME, DEPTNO, WEIGHT FROM STUD_101;

SELECT STUDNO, NAME, DEPTNO, WEIGHT FROM STUD_HEAVY
INTERSECT
SELECT STUDNO, NAME, DEPTNO, WEIGHT FROM STUD_101;

SELECT STUDNO, NAME, DEPTNO, WEIGHT FROM STUD_HEAVY
MINUS
SELECT STUDNO, NAME, DEPTNO, WEIGHT FROM STUD_101;

/*
1 2 3
4 5 6
7 8 9
*/
SELECT 1, 2, 3, 4, 5, 6, 7, 8, 9 FROM DUAL;
SELECT 1, 2, 3 FROM DUAL
UNION 
SELECT 4, 5, 6 FROM DUAL
UNION 
SELECT 7, 8, 9 FROM DUAL;

SELECT (ROWNUM-1)*3+1 N1, (ROWNUM-1)*3+2 N2, (ROWNUM-1)*3+3 N3 
FROM STUDENT
WHERE ROWNUM <= 3;

-- ÇÐ»ýÅ×ÀÌºí¿¡¼­ÀÌ¸§À»°¡³ª´Ù¼øÀ¸·ÎÁ¤Ž¶ÇÏ¿©ÀÌ¸§, ÇÐ³â,  †È­¹øÈ£¸¦­t·ÂÇÏ¿©¶ó
SELECT * FROM STUDENT;
SELECT NAME, GRADE, TEL FROM STUDENT;
SELECT NAME, GRADE, TEL FROM STUDENT
ORDER BY 1;

-- ÇÐ»ýÅ×ÀÌºí¿¡¼­ÇÐ³âÀ»³»¸²Â÷¼øÀ¸·ÎÁ¤Ž¶ÇÏ¿©ÀÌ¸§, ÇÐ³â,  †È­¹øÈ£¸¦­t·ÂÇÏ¿©¶ó
SELECT NAME, GRADE, TEL FROM STUDENT
ORDER BY GRADE DESC;

-- ÇÐ»ýÅ×ÀÌºí¿¡¼­ÇÐ³âÀ»³»¸²Â÷¼ø, ÀÌ¸§ ³»¸²Â÷¼øÀ¸·ÎÁ¤Ž¶ÇÏ¿©ÀÌ¸§, ÇÐ³â,  †È­¹øÈ£¸¦­t·ÂÇÏ¿©¶ó
SELECT NAME, GRADE, TEL FROM STUDENT
ORDER BY 2 DESC, 1 DESC;



-- ÇÐ»ý Å×ÀÌºí¿¡¼­ ÇÐ¹ø, ÀÌ¸§, Åº»ý³âµµ¸¦ Á¶È¸
SELECT * FROM STUDENT;
SELECT GRADE, NAME, 
TO_CHAR(BIRTHDATE, 'YYYY') "Åº»ý³âµµ" FROM STUDENT;
-- ÀÌ µÑÀÇ Â÷ÀÌ´Â ´ÜÀÏÇàÀÌ³Ä º¹¼öÇàÀÌ³ÄÀÇ Â÷ÀÌ
-- ÇÐ»ý Å×ÀÌºí¿¡¼­ Æò±ÕÅ°, Æò±Õ ¸ö¹«°Ô Á¶È¸
SELECT * FROM STUDENT;
SELECT AVG(HEIGHT), AVG(WEIGHT) FROM STUDENT;

-- ÇÐ»ýÅ×ÀÌºí¿¡¼­ "±è¿µ±Õ? ÇÐ»ýÀÇÀÌ¸§, »ç¿ëÀÚ¾ÆÀÌµð¸¦ Ãâ·ÂÇÏ¿©¶ó.
-- ±×¸®°í »ç¿ëÀÚ ¾ÆÀÌµðÀÇ Ã¹¹®ÀÚ¸¦ ´ë¹®ÀÚ·Î º¯È¯ÇÏ¿© Ãâ·ÂÇÏ¿©¶ó
SELECT * FROM STUDENT;
SELECT NAME, USERID, INITCAP(USERID) "¾ÆÀÌµð", LOWER(USERID), UPPER(USERID) FROM STUDENT
WHERE NAME = '±è¿µ±Õ';

-- ºÎ¼­Å×ÀÌºí¿¡¼­ ºÎ¼­ÀÌ¸§ÀÇ ±æÀÌ¸¦ ¹®ÀÚ ¼ö¿Í ¹ÙÀÌÆ® ¼ö·Î °¢°¢ Ãâ·ÂÇÏ¿©¶ó
SELECT * FROM DEPARTMENT;
SELECT DNAME, LENGTH(DNAME), LENGTHB(DNAME)
FROM DEPARTMENT;

-- ÇÐ»ýÅ×ÀÌºí¿¡¼­ 1ÇÐ³âÇÐ»ýÀÇ ÁÖ¹Îµî·Ï¹øÈ£¿¡¼­ »ý³â¿ùÀÏ°ú 
-- ÅÂ¾î³­´ÞÀ» ÃßÃâÇÏ¿© ÀÌ¸§, ÁÖ¹Î¹øÈ£, »ý³â¿ùÀÏ, ÅÂ¾î³­´ÞÀ» Ãâ·ÂÇÏ¿©¶ó.
SELECT * FROM STUDENT;
SELECT NAME, IDNUM, BIRTHDATE FROM STUDENT;
SELECT 
    NAME, GRADE, IDNUM, SUBSTR(IDNUM, 1,6) "Ãâ»ý³âµµ", SUBSTR(IDNUM,3,2) "Ãâ»ý ´Þ"
FROM 
    STUDENT
WHERE 
    GRADE = 1;

SELECT 1, '12345678901234567890' FROM DUAL
UNION
SELECT 2, 'CORPORATE FLOOR' FROM DUAL
UNION
SELECT 3, TO_CHAR(INSTR('CORPORATE FLOOR', 'OR')) FROM DUAL
UNION
SELECT 4, TO_CHAR(INSTR('CORPORATE FLOOR', 'OR', 3)) FROM DUAL
UNION
SELECT 5, TO_CHAR(INSTR('CORPORATE FLOOR', 'OR', 3, 2)) FROM DUAL
UNION
SELECT 6, TO_CHAR(INSTR('CORPORATE FLOOR', 'OR', -3)) FROM DUAL
UNION
SELECT 7, TO_CHAR(INSTR('CORPORATE FLOOR', 'OR', -3, 2)) FROM DUAL;