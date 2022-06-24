SELECT COUNT(*) FROM TBL_BOARD WHERE BNO > 0;

SELECT * FROM (
    SELECT 
        /*+ INDEX_DESC(TBL_BOARD BOARD_PK) */
        ROWNUM RN,
        BNO,
        TITLE,
        CONTENT,
        WRITER,
        REGDATE,
        UPDATEDATE
    FROM
        TBL_BOARD
    WHERE ROWNUM <= 3 * 10
)
WHERE RN > (3 - 1) * 10;