SELECT RN, BNO, TITLE, CONTENT FROM (
    SELECT
    /*+ INDEX_DESC(TBL_BOARD BOARD_PK) */
    ROWNUM RN, BNO, TITLE, CONTENT 
    FROM TBL_BOARD
    WHERE ROWNUM <= 3 * 10
)
WHERE RN > (3 - 1) * 10;

-- ���� : ��������ȣ�� �����ϴ� ���ǹ�, BNO ����, ��������ȣ, AMOUNT
-- �������¡ : ��������ȣ�� �������� ���� ���ǹ�, BNO ����, �������۹�ȣ, AMOUNT

    SELECT
    /*+ INDEX(TBL_BOARD BOARD_PK) */
    ROWNUM RN, BNO, TITLE, CONTENT 
    FROM TBL_BOARD
    WHERE ROWNUM <= 10
    AND BNO > 42;




SELECT
/*+ INDEX_DESC() */
* FROM TBL_BOARD ORDER BY BNO + 1 DESC;

SELECT
/*+ FULL(T) */ T.*, ROWNUM
FROM TBL_BOARD T ORDER BY BNO DESC;


SELECT
/*+ FULL(TBL_BOARD) */
* FROM TBL_BOARD WHERE BNO = 1;

SELECT ROWNUM, BNO, TITLE FROM TBL_BOARD ORDER BY BNO DESC;


SELECT * FROM TBL_BOARD ORDER BY BNO + 1 DESC;

INSERT INTO TBL_BOARD (BNO, TITLE, CONTENT, WRITER)
SELECT SEQ_BOARD.NEXTVAL, TITLE, CONTENT, WRITER FROM TBL_BOARD;

ROLLBACK;


SELECT COUNT(*) FROM TBL_BOARD;