CREATE TABLE TB_GRADE_2019
(
TEST_MONTH CHAR(2 BYTE) NOT NULL, --월
TEST_CD CHAR(3 BYTE) NOT NULL, -- 시험코드
KOR NUMBER(3), -- 국어
ENG NUMBER(3), -- 영어
MAT NUMBER(3) -- 수학
);

CREATE UNIQUE INDEX PK_TB_GRADE_2019 ON TB_GRADE_2019 (TEST_MONTH, TEST_CD);

ALTER TABLE TB_GRADE_2019 ADD (CONSTRAINT PK_TB_GRADE_2019 PRIMARY KEY (TEST_MONTH, TEST_CD));

INSERT INTO TB_GRADE_2019 VALUES ('01','TO1',92,98,84);
INSERT INTO TB_GRADE_2019 VALUES ('01','T02',84,94,90);
COMMIT;

SELECT *
FROM TB_GRADE_2019;

DESC TB_GRADE_2019;
DESCRIBE TB_GRADE_2019;

SELECT*
FROM TB_GRADE_2019;

RENAME TB_GRADE_2019 TO TB_2019_GRADE;

SELET *
FROM TB_GRADE_2019;

SELECT *
FROM TB_2019_GRADE;

RENAME TB_2019_GRADE TO TB_GRADE_2019;

SELECT *
FROM TB_GRADE_2019;

SELECT *
FROM TB_GRADE_2019;

DESC TB_GRADE_2019;

ALTER TABLE TB_GRADE_2019 ADD (TOT NUMBER(5) NULL);
ALTER TABLE TB_GRADE_2019 ADD (AVG NUMBER(5,1) NULL);

DESC TB_GRADE_2019;

ALTER TABLE TB_GRADE_2019 MODIFY (TOT NUMBER(6));
ALTER TABLE TB_GRADE_2019 RENAME COLUMN TOT TO M_TOT;

ALTER TABLE TB_GRADE_2019 MODIFY (AVG NUMBER(6,2));
ALTER TABLE TB_GRADE_2019 RENAME COLUMN AVG TO M_AVG;

DESC TB_GRADE_2019;

SELECT INDEX_NAME,
COLUMN_NAME,
COLUMN_POSITION,
CHAR_LENGTH,
DESCEND
FROM USER_IND_COLUMNS
WHERE TABLE_NAME = 'TB_GRADE_2019';

CREATE INDEX IDX_KOR_SCORE ON TB_GRADE_2019 (TEST_MONTH, TEST_CD, KOR);
CREATE INDEX IDX_ENG_SCORE ON TB_GRADE_2019 (TEST_MONTH, TEST_CD, ENG);
CREATE INDEX IDX_MAT_SCORE ON TB_GRADE_2019 (TEST_MONTH, TEST_CD, MAT);

SELECT INDEX_NAME,
COLUMN_NAME,
COLUMN_POSITION,
CHAR_LENGTH,
DESCEND
FROM USER_IND_COLUMNS
WHERE TABLE_NAME = 'TB_GRADE_2019';

ALTER INDEX IDX_KOR_SCORE RENAME TO IDX_KOR_GRADE;
ALTER INDEX IDX_ENG_SCORE RENAME TO IDX_ENG_GRADE;
ALTER INDEX IDX_MAT_SCORE RENAME TO IDX_MAT_GRADE;

SELECT INDEX_NAME,
COLUMN_NAME,
COLUMN_POSITION,
CHAR_LENGTH,
DESCEND
FROM USER_IND_COLUMNS
WHERE TABLE_NAME = 'TB_GRADE_2019';

DROP INDEX IDX_KOR_GRADE;
DROP INDEX IDX_ENG_GRADE;
DROP INDEX IDX_MAT_GRADE;

SELECT INDEX_NAME,
COLUMN_NAME,
COLUMN_POSITION,
CHAR_LENGTH,
DESCEND
FROM USER_IND_COLUMNS
WHERE TABLE_NAME = 'TB_GRADE_2019';

SELECT A.CONSTRAINT_NAME,
A.CONSTRAINT_TYPE,
A.TABLE_NAME,
B.POSITION,
B.COLUMN_NAME
FROM SYS.USER_CONSTRAINTS A,
SYS.USER_CONS_COLUMNS B
WHERE A.CONSTRAINT_NAME = B.CONSTRAINT_NAME
AND A.TABLE_NAME = 'TB_GRADE_2020'
AND A.CONSTRAINT_TYPE = 'P';

ALTER TABLE TB_GRADE_2020 DROP CONSTRAINT PK_TB_GRADE_2020;

SELECT A.CONSTRAINT_NAME,
A.CONSTRAINT_TYPE,
A.TABLE_NAME,
B.POSITION,
B.COLUMN_NAME
FROM SYS.USER_CONSTRAINTS A,
SYS.USER_CONS_COLUMNS B
WHERE A.CONSTRAINT_NAME = B.CONSTRAINT_NAME
AND A.TABLE_NAME = 'TB_GRADE_2020'
AND A.CONSTRAINT_TYPE = 'P';

ALTER TABLE TB_GRADE_2020 ADD (CONSTRAINT PK_TB_GRADE_2020_P1
PRIMARY KEY (TEST_MONTH, TEST_CD));

SELECT
A.CONSTRAINT_TYPE,
A.TABLE_NAME,
B.POSITION,
B.COLUMN_NAME
FROM SYS.USER_CONSTRAINTS A,
SYS.USER_CONS_COLUMNS B
WHERE A.CONSTRAINT_NAME = B.CONSTRAINT_NAME
AND A.TABLE_NAME = 'TB_GRADE_2020'
AND A.CONSTRAINT_TYPE = 'P';

SELECT *
FROM TB_GRADE_2019;

TRUNCATE TABLE TB_GRADE_2019;

SELECT *
FROM TB_GRADE_2019;

DROP TABLE TB_GRADE_2019;

DESC TB_GRADE_2019;

FLASHBACK TABLE TB_GRADE_2019 TO BEFORE DROP;

DESC TB_GRADE_2019;

DROP TABLE TB_GRADE_2019;

PURGE RECYCLEBIN;

FLASHBACK TABLE TB_GRADE_2019 TO BEFORE DROP;

DESC TB_GRADE_2019;