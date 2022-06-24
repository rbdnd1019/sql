CREATE TABLE TBL_SAMPLE1 (COL1 VARCHAR2(50));
DROP TABLE TBL_SAMPLE1;
CREATE TABLE TBL_SAMPLE2 (COL1 VARCHAR2(5));
DROP TABLE TBL_SAMPLE2;

INSERT INTO TBL_SAMPLE1 VALUES ('ABCDE');
INSERT INTO TBL_SAMPLE2 VALUES ('ABCDE');

TRUNCATE TABLE TBL_SAMPLE1;
TRUNCATE TABLE TBL_SAMPLE2;

SELECT * FROM TBL_SAMPLE1;
SELECT * FROM TBL_SAMPLE2;

ALTER TABLE TBL_BOARD ADD(REPLYCNT NUMBER DEFAULT 0);

SELECT 
    /*+ INDEX_DESC(T BOARD_PK) */ T.*
    
--   , (SELECT COUNT(RNO) FROM TBL_REPLY R WHERE T.BNO = R.BNO) REPLYCNT
FROM TBL_BOARD T WHERE ROWNUM <= 10;

UPDATE TBL_BOARD SET
    REPLYCNT = (SELECT COUNT(RNO) FROM TBL_REPLY R WHERE TBL_BOARD.BNO = R.BNO);

