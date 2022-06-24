SELECT * FROM STUDENT;

-- ÇÐ»ý Å×ÀÌºí¿¡¼­ ÇÐ¹ø, ÀÌ¸§, ÇÐ°ú¹øÈ£¸¦ Á¶È¸ÇÏ½Ã¿À
SELECT STUDNO, NAME , DEPTNO FROM STUDENT;

-- Áßº¹À» Ä«¿îÆ®ÇÒ¶§ ÇàÀ» ±âÁØÀ¸·Î
SELECT 
    DEPTNO,
    NAME 
FROM
    STUDENT 
WHERE
    deptno != 101
    AND 1=1
ORDER BY 1 ;

-- ÇÐ»ýÅ×ÀÌºí¿¡¼­ ÇÐ°úº° ÀÎ¿ø½º¸¦ Á¶È¸
SELECT DEPTNO, COUNT(*)
FROM STUDENT
GROUP BY DEPTNO  -- ÇÐ°úº° ÀÎ¿ø¼ö°¡ ³ª¿È
HAVING COUNT(*) >= 5;

SELECT * FROM STUDENT;
--ÇÐ»ýÅ×ÀÌºí¿¡¼­Áßº¹µÇ´ÂÇÐ°ú¹øÈ£(deptno)¸¦Á¦¿ÜÇÏ°í­t·ÂÇÏ¿©¶ó
SELECT DISTINCT DEPTNO FROM STUDENT;
--ÇÐ»ýÅ×ÀÌºí¿¡¼­Áßº¹µÇ´ÂÇÐ°ú¹øÈ£, ÇÐ³âÁ¦¿ÜÇÏ°í­t·ÂÇÏ¿©¶ó
SELECT DEPTNO, GRADE FROM STUDENT ORDER BY 1 DESC, 2;

-- µ¥ÀÌÅÍº£ÀÌ½º ¹®ÀÚ¿­ ¸®ÅÍ¸± : '' ²À ÀÌ°Å ½á¾ßÇÔ

-- HELLO WORLD¸¦ Ãâ·ÂÇÏ½Ã¿À
SELECT 'HELLO WORLD' FROM STUDENT;

-- ÇÐ»ýÀÇ ÀÌ¸§°ú '¾È³ç'°áÇÕ
SELECT NAME || ' ¾È³ç' FROM STUDENT;

SELECT CONCAT(NAME, ' ¾È³ç') AS HI FROM STUDENT ;  -- ÄÃ·³¿¡¼­´Â AS´Â ÇÊ¼ö°¡ ¾Æ´Ô

-- ÇÐ¹ø¿¡ "ÇÐ¹ø" ÀÌ¸§¿¡´Â "ÀÌ¸§"À» ºÎ¿©ÇÑ º°ÄªÀ¸·Î ÇÐ¹ø,ÀÌ¸§ Á¶È¸
SELECT STUDNO "ÇÐ¹ø", NAME "ÀÌ¸§" FROM STUDENT;

-- ºÎ¼­Å×ÀÌºí¿¡¼­ºÎ¼­ÀÌ¸§Ä®·³ÀÇº°¸íÀºdept_name, ºÎ¼­¹øÈ£Ä®·³ÀÇº°¸íÀºDNÀ¸·ÎºÎ¿©ÇÏ¿©­t·ÂÇÏ¿©¶ó
SELECT * FROM department;
SELECT DNAME, DEPTNO FROM department;
SELECT DNAME "dept_name", DEPTNO "DN" FROM department;

-- ÇÐ»ýÅ×ÀÌºí¿¡¼­ÇÐ¹ø°úÀÌ¸§Ä®·³À»¿¬°áÇÏ¿©¡°Student¡±¶ó´Âº°¸íÀ¸·ÎÇÏ³ªÀÇÄ®·³Ã³·³¿¬°áÇÏ¿©­t·ÂÇÏ¿©¶ó
SELECT * FROM STUDENT;
SELECT STUDNO, NAME FROM student;
SELECT STUDNO || ' ' || NAME "STUDENT" FROM student;

-- ÇÐ»ýÀÇ¸ö¹«°Ô¸¦pound·ÎÃQ»êÇÏ°íÄ®·³ÀÌ¸§À»?weight_pound?¶ó´Âº°¸íÀ¸·Î­t·ÂÇÏ¿©¶ó. 1kgÀº2.2poundÀÌ´Ù.
SELECT * FROM STUDENT;
SELECT STUDNO,NAME, WEIGHT FROM STUDENT;
SELECT NAME, WEIGHT, WEIGHT * 2.2 || 'POUND' "weight_pound"  FROM STUDENT;

/* 
SELECT
FROM
WHERE
GROUP BY
HAVING
ORDER BY
ÀÌ ¼ø¼­ ±²ÀåÈ÷ Áß¿äÇÔ!!!!!!!!!!!!!!!!!!!!!
*/


SELECT DEPTNO, COUNT(*)
FROM STUDENT
WHERE WEIGHT IS NOT NULL
GROUP BY DEPTNO
HAVING COUNT(DEPTNO) >= 5
ORDER BY DEPTNO;

-- ¿À·ù ¹ß»ý ¼ø¼­ 
-- FROM >> HAVING >> GROUP BY >> WHERE >> SELECT >> ORDER BY  ÀÌ ¼ø¼­´Â ´Ù¸¦ ¼ö ÀÖÀ½

DROP TABLE EX_TYPE;
CREATE TABLE EX_TYPE (
    C CHAR(10),
    V VARCHAR(10)
);

INSERT INTO EX_TYPE VALUES ('sql', 'sql');
SELECT * FROM EX_TYPE;


SELECT *
FROM EX_TYPE
WHERE C = 'sql';

SELECT *
FROM EX_TYPE
WHERE V = 'sql';

SELECT *
FROM EX_TYPE
WHERE C = 'sql      ';

SELECT *
FROM EX_TYPE
WHERE V = 'sql      ';


SELECT *
FROM EX_TYPE
WHERE C = V;

SELECT 1 
FROM DUAL
WHERE 1 = '1';

SELECT 3.14 + 1 FROM DUAL;

SELECT STUDNO, NAME, BIRTHDATE, SYSDATE, ROUND(SYSDATE - BIRTHDATE)
FROM STUDENT
WHERE STUDNO = 10101;

SELECT SYSDATE - TO_DATE('92/10/19') FROM DUAL;

SELECT 
    TO_CHAR(SYSDATE , 'YY/MM/DD HH24:MI:SS') NOW,
    TO_CHAR(SYSDATE + 1, 'YY/MM/DD HH24:MI:SS') "1DAY_AFTER",
    TO_CHAR(SYSDATE + 3 / 24, 'YY/MM/DD HH24:MI:SS') "3 HOURS AFTER",
    TO_CHAR(SYSDATE + 30 / 24/ 60, 'YY/MM/DD HH24:MI:SS') "30MINUTE AFTER",
    TO_CHAR(SYSDATE + 0.5, 'YY/MM/DD HH24:MI:SS') "12HOUR AFTER",
    TO_CHAR(SYSDATE + 50 / 24/ 60, 'YY/MM/DD HH24:MI:SS'),
    ADD_MONTHS(SYSDATE, -1)
FROM DUAL;

SELECT
    TO_CHAR(TO_DATE('92/10/19'),'YY/MM/DD HH24:MI:SS') 
FROM DUAL;

SELECT ROUND(SYSDATE-1/24, 'MM') FROM DUAL;

SELECT ROWID,ROWNUM, S.* FROM STUDENT S ORDER BY STUDNO DESC;
