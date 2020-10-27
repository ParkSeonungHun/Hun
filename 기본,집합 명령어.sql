SELECT SYSDATE FROM DUAL;
SELECT *
FROM TB_CUSTOMER;
SELECT *
FROM TB_ADD_CUSTOMER;
SELECT *
FROM TB_POINT;
SELECT *
FROM TB_POINT_2017;
SELECT *
FROM TB_POINT_2018;
SELECT *
FROM TB_POINT_2019;
SELECT *
FROM TB_ETC_INFO;
SELECT *
FROM TB_ITEM_INFO;
SELECT *
FROM TB_SALES;
SELECT *
FROM TB_SALES_09;
SELECT *
FROM TB_POINT_INFO;
SELECT *
FROM TB_GRADE;
SELECT *
FROM TB_GRADE_07;
SELECT *
FROM TB_GRADE_08;
SELECT *
FROM TB_GRADE_09;
SELECT *
FROM TB_GRADE_2019;
SELECT *
FROM TB_GRADE_2020;
SELECT *
FROM TB_CLASS_INFO;
SELECT *
FROM TB_TRAIN_TM;
SELECT *
FROM TB_CUSTOMER;
SELECT CUSTOMER_CD,
CUSTOMER_NM,
PHONE_NUMBER,
EMAIL
FROM TB_CUSTOMER;
SELECT CUSTOMER_CD AS 고객코드,
CUSTOMER_NM AS 고객명,
PHONE_NUMBER AS 전화번호,
EMAIL AS 이메일
FROM TB_CUSTOMER;
SELECT CUSTOMER_CD AS "Customer Cd",
CUSTOMER_NM AS "01_고객명",
MW_FLG AS "_성별_",
PHONE_NUMBER AS "전화 번호"
FROM TB_CUSTOMER;
SELECT *
FROM TB_CUSTOMER
WHERE CUSTOMER_CD IN ('2017108','2018254','2019167')
AND MW_FLG = 'M';
SELECT *
FROM TB_CUSTOMER
ORDER BY MW_FLG DESC,
CUSTOMER_NM;
SELECT CUSTOMER_CD,
CUSTOMER_NM,
MW_FLG,
BIRTH_DAY,
PHONE_NUMBER
FROM TB_CUSTOMER
ORDER BY 3 DESC, 2;
SELECT *
FROM TB_CUSTOMER
WHERE MW_FLG = 'M'
ORDER BY TOTAL_POINT DESC ;
SELECT CLASS_CD
FROM TB_GRADE
GROUP BY CLASS_CD;
SELECT CLASS_CD,
SUM(KOR) AS TOT_KOR,
AVG(KOR) AS AVG_KOR,
MIN(KOR) AS MIN_KOR,
MAX(KOR) AS MAX_KOR,
COUNT(*) AS COUNT
FROM TB_GRADE
GROUP BY CLASS_CD;
SELECT CLASS_CD,
SUM(KOR) AS TOT_KOR,
SUM(ENG) AS TOT_ENG,
SUM(MAT) AS TOT_MAT,
ROUND(AVG(KOR),1) AS AVG_KOR,
ROUND(AVG(ENG),1) AS AVG_ENG,
ROUND(AVG(MAT),1) AS AVG_MAT
FROM TB_GRADE
GROUP BY CLASS_CD;
SELECT DISTINCT SALES_DT,
PRODUCT_NM
FROM TB_SALES
ORDER BY SALES_DT,
PRODUCT_NM;
SELECT DISTINCT PRODUCT_NM
FROM TB_SALES
ORDER BY PRODUCT_NM;
SELECT B.CLASS_NM,
A.STUDENT_NO,
A.STUDENT_NM,
A.KOR,
A.ENG,
A.MAT,
A.TOT,
A.AVG
FROM TB_GRADE A,
TB_CLASS_INFO B
WHERE A.CLASS_CD = B.CLASS_CD;
SELECT A.TEST_CD AS "08_TEST_CD",
A.KOR AS "08_KOR",
A.ENG AS "08_ENG",
A.MAT AS "08_MAT"
FROM TB_GRADE_08 A
JOIN TB_GRADE_09 B
ON A.TEST_CD = B.TEST_CD;
SELECT A.TEST_CD AS "08_TEST_CD",
A.KOR AS "08_KOR",
A.ENG AS "08_ENG",
A.MAT AS "08_MAT",
B.TEST_CD AS "09_TEST_CD",
B.KOR AS "09_KOR",
B.ENG AS "09_ENG",
B.MAT AS "09_MAT"
FROM TB_GRADE_08 A
LEFT JOIN TB_GRADE_09 B
ON A.TEST_CD = B.TEST_CD;
SELECT A.TEST_CD AS "08_TEST_CD",
A.KOR AS "08_KOR",
A.ENG AS "08_ENG",
A.MAT AS "08_MAT",
B.TEST_CD AS "09_TEST_CD",
B.KOR AS "09_KOR",
B.ENG AS "09_ENG",
B.MAT AS "09_MAT"
FROM TB_GRADE_08 A
RIGHT JOIN TB_GRADE_09 B
ON A.TEST_CD = B.TEST_CD;
SELECT A.TEST_CD AS "08_TEST_CD",
A.KOR AS "08_KOR",
A.ENG AS "08_EMG",
A.MAT AS "08_MAT",
B.TEST_CD AS "09_TEST_CD",
B.KOR AS "09_KOR",
B.ENG AS "09_ENG",
B.MAT AS "09_MAT"
FROM TB_GRADE_08 A,
TB_GRADE_09 B
WHERE A.TEST_CD(+) = B.TEST_CD;
SELECT A.TEST_CD AS "08_TEST_CD",
A.KOR AS "08_KOR",
A.ENG AS "08_ENG",
A.MAT AS "08_MAT",
B.TEST_CD AS "09_TEST_CD",
B.KOR AS "09_KOR",
B.ENG AS "09_ENG",
B.MAT AS "09_MAT"
FROM TB_GRADE_08 A
FULL OUTER JOIN TB_GRADE_09 B
ON A.TEST_CD = B.TEST_CD;
SELECT CLASS_CD,
STUDENT_NO,
STUDENT_NM,
CASE WHEN KOR >= 90 AND KOR <= 100 THEN '수'
WHEN KOR >= 80 AND KOR <= 89 THEN '우'
WHEN KOR >= 70 AND KOR <= 79 THEN '미'
WHEN KOR >= 60 AND KOR <= 69 THEN '양'
WHEN KOR < 60 THEN '가'
END AS KOR,
CASE WHEN ENG BETWEEN 90 AND 100 THEN '수'
WHEN ENG BETWEEN 80 AND 89 THEN '우'
WHEN ENG BETWEEN 70 AND 79 THEN '미'
WHEN ENG BETWEEN 60 AND 69 THEN '양'
ELSE '가'
END AS ENG,
CASE WHEN MAT IN (90,91,92,93,94,95,96,97,98,99,100) THEN '수'
WHEN MAT IN (80,81,82,83,84,85,86,87,88,89) THEN '우'
WHEN MAT IN (70,71,72,73,74,75,76,77,78,79) THEN '미'
WHEN MAT IN (60,61,62,63,64,65,66,67,68,69) THEN '양'
ELSE '가'
END AS MAT,
TOT,
AVG
FROM TB_GRADE;
SELECT CASE CLASS_CD WHEN 'A' THEN '종합입시반'
WHEN 'B' THEN '단과반'
WHEN 'C' THEN '대학편입반'
WHEN 'D' THEN '일반인반'
END AS CLASS_NM,
STUDENT_NO,
STUDENT_NM
FROM TB_GRADE ;
SELECT ROWNUM,
CUSTOMER_CD,
CUSTOMER_NM,
MW_FLG,
BIRTH_DAY,
PHONE_NUMBER
FROM TB_CUSTOMER;
SELECT ROWNUM, A.*
FROM TB_CUSTOMER A;
SELECT ROWNUM,
CUSTOMER_CD,
CUSTOMER_NM,
MW_FLG,
BIRTH_DAY,
PHONE_NUMBER
FROM TB_CUSTOMER
WHERE MW_FLG = 'M'
ORDER BY CUSTOMER_NM;
SELECT *
FROM TB_CUSTOMER
WHERE PHONE_NUMBER IS NULL
OR EMAIL IS NULL;
SELECT *
FROM TB_CUSTOMER
WHERE (MW_FLG = 'M'
AND EMAIL IS NULL)
OR (MW_FLG = 'W'
AND EMAIL IS NOT NULL)
ORDER BY MW_FLG DESC;
SELECT *
FROM TB_CUSTOMER
WHERE CUSTOMER_NM IN ('강원진','박승대','이혜옥','남궁소망','한찬희')
AND PHONE_NUMBER IS NOT NULL;
SELECT *
FROM DUAL;
SELECT 123 * 45,
SYSDATE + 30,
'1Day SQL' || ' 실습',
SUBSTR('20190820',1,4)
FROM DUAL;
SELECT '2019-' || ROWNUM
FROM DUAL
CONNECT BY LEVEL <= 5;
SELECT *
FROM TB_GRADE;
UPDATE TB_GRADE
SET TOT = KOR + ENG + MAT,
AVG = ROUND((KOR + ENG + MAT) / 3,1)
WHERE CLASS_CD IN ('A','B');
SELECT *
FROM TB_GRADE;
UPDATE TB_GRADE
SET TOT = KOR + ENG + MAT,
AVG = ROUND((KOR + ENG + MAT) / 3,1);
SELECT *
FROM TB_GRADE;
COMMIT;
SELECT *
FROM TB_GRADE;
INSERT INTO TB_GRADE (CLASS_CD, STUDENT_NO, STUDENT_NM, KOR, ENG, MAT)
VALUES ('A',3,'독고승재',97,88,95);
INSERT INTO TB_GRADE VALUES ('B',4,'이도희',86,92,90,0,0);
SELECT *
FROM TB_GRADE
ORDER BY CLASS_CD,
STUDENT_NO;
COMMIT;
SELECT * FROM TB_POINT_2017;
SELECT * FROM TB_POINT_2018;
SELECT * FROM TB_POINT_2019;
INSERT ALL
WHEN SUBSTR(REG_DTTM,1,4) = '2017' THEN INTO TB_POINT_2017
WHEN SUBSTR(REG_DTTM,1,4) = '2018' THEN INTO TB_POINT_2018
WHEN SUBSTR(REG_DTTM,1,4) = '2019' THEN INTO TB_POINT_2019
ELSE INTO TB_POINT_2019
SELECT CUSTOMER_CD,
SEQ_NO,
POINT_MEMO,
POINT,
REG_DTTM
FROM TB_POINT
WHERE REG_DTTM >= '20170101000000';
SELECT * FROM TB_POINT_2017;
SELECT * FROM TB_POINT_2018;
SELECT * FROM TB_POINT_2019;
COMMIT;
SELECT *
FROM TB_CUSTOMER;
SELECT *
FROM TB_ADD_CUSTOMER;
MERGE INTO TB_CUSTOMER CU
USING TB_ADD_CUSTOMER NC
ON (CU.CUSTOMER_CD = NC.CUSTOMER_CD)
WHEN MATCHED THEN
UPDATE SET CU.CUSTOMER_NM = NC.CUSTOMER_NM,
CU.MW_FLG = NC.MW_FLG,
CU.BIRTH_DAY = NC.BIRTH_DAY,
CU.PHONE_NUMBER = NC.PHONE_NUMBER
WHEN NOT MATCHED THEN
INSERT (CU.CUSTOMER_CD, CU.CUSTOMER_NM, CU.MW_FLG, CU.BIRTH_DAY, CU.PHONE_NUMBER, CU.EMAIL, CU.TOTAL_POINT, CU.REG_DTTM)
VALUES (NC.CUSTOMER_CD, NC.CUSTOMER_NM, NC.MW_FLG, NC.BIRTH_DAY, NC.PHONE_NUMBER, '', 0,'20191015082030');
SELECT *
FROM TB_CUSTOMER;
COMMIT;
SELECT *
FROM TB_GRADE
ORDER BY CLASS_CD,
STUDENT_NO;
DELETE
FROM TB_GRADE
WHERE STUDENT_NM IN ('나경숙','박승대','이아름');
SELECT *
FROM TB_GRADE
ORDER BY CLASS_CD,
STUDENT_NO;
COMMIT;
SELECT *
FROM TB_GRADE
ORDER BY CLASS_CD,
STUDENT_NO;
UPDATE TB_GRADE
SET TOT = KOR + ENG + MAT,
AVG = ROUND((KOR + ENG + MAT) / 3,1)
WHERE STUDENT_NM IN ('독고승재','이도희');
SELECT *
FROM TB_GRADE
ORDER BY CLASS_CD,
STUDENT_NO;
COMMIT;
ROLLBACK;
SELECT *
FROM TB_GRADE
ORDER BY CLASS_CD,
STUDENT_NO;
DELETE
FROM TB_GRADE
WHERE CLASS_CD IN ('B','D');
SELECT *
FROM TB_GRADE
ORDER BY CLASS_CD,
STUDENT_NO;
ROLLBACK;
SELECT *
FROM TB_GRADE
ORDER BY CLASS_CD,
STUDENT_NO;
SELECT *
FROM TB_CUSTOMER
WHERE CUSTOMER_CD = '2017042';
SELECT *
FROM TB_POINT
WHERE CUSTOMER_CD = '2017042';
INSERT INTO TB_POINT VALUES ('2017042',5,'드라이기 구매 포인트 적립',3200,
'20190801234530');
SELECT *
FROM TB_POINT
WHERE CUSTOMER_CD = '2017042';
UPDATE TB_CUSTOMER CU
SET CU.TOTAL_POINT = (SELECT SUM(CP.POINT)
FROM TB_POINT CP
WHERE CP.CUSTOMER_CD = CU.CUSTOMER_CD
GROUP BY CP.CUTOMER_CD
)
WHERE CP.CUSTOMER_CD = '2017042';
ROLLBACK;
UPDATE TB_CUSTOMER CU
SET CU.TOTAL_POINT = (SELECT SUM(CP.POINT)
FROM TB_POINT CP
WHERE CP.CUSTOMER_CD = CU.CUSTOMER_CD
GROUP BY CP.CUSTOMER_CD
)
WHERE CU.CUSTOMER_CD = '2017042';
SELECT *
FROM TB_CUSTOMER
WHERE CUSTOMER_CD = '2017042';
COMMIT;
SELECT S2.CUSTOMER_CD,
(SELECT CT.CUSTOMER_NM
FROM TB_CUSTOMER CT
WHERE CT.CUSTOMER_CD = S2.CUSTOMER_CD
) AS CUSTOMER_NM,
S2.TOT_POINT
FROM (
SELECT S1.CUSTOMER_CD,
S1.TOT_POINT
FROM (
SELECT CUSTOMER_CD,
SUM(POINT) AS TOT_POINT
FROM TB_POINT
WHERE CUSTOMER_CD >= '2019000'
GROUP BY CUSTOMER_CD
) S1
WHERE S1.TOT_POINT > 10000
) S2
WHERE S2.CUSTOMER_CD IN (SELECT CUSTOMER_CD
FROM TB_CUSTOMER
WHERE MW_FLG = 'W'
);
SELECT CUSTOMER_CD,
SUM(POINT) AS TOT_POINT
FROM TB_POINT
WHERE CUSTOMER_CD >= '2019000'
GROUP BY CUSTOMER_CD;
SELECT *
FROM TB_POINT CP
WHERE EXISTS (SELECT 'A'
FROM TB_CUSTOMER CU
WHERE CU.CUSTOMER_CD = CP.CUSTOMER_CD
AND CU.MW_FLG = 'M');
SELECT *
FROM TB_GRADE
WHERE CLASS_CD = :V1
ORDER BY CLASS_CD,
STUDENT_NO;
SELECT *
FROM TB_CUSTOMER
WHERE CUSTOMER_NM LIKE '%' || :고객명 || '%'
AND MW_FLG = :성별;
REM ************************************
REM :: CUSTOMER_CD가 '2018000' 이상인 고객을 검색
REN ************************************
SELECT CUSTOMER_CD, -- 고객코드
CUSTOMER_NM, -- 고객명
MW_FLG, -- 성별
BIRTH_DAY, -- 생일
/*
PHONE_NUMBER, 전화전호
EMAIL, 이메일
*/
TOTAL_POINT, --포인트
REG_DTTM -- 등록일
FROM TB_CUSTOMER
WHERE CUSTOMER_CD >= '2018000';
SELECT STUDENT_NM
FROM TB_GRADE
WHERE KOR >= 90
ORDER BY CLASS_CD,
STUDENT_NO;
SELECT STUDENT_NM
FROM TB_GRADE
WHERE ENG >= 90
ORDER BY CLASS_CD,
STUDENT_NO;
SELECT STUDENT_NM
FROM TB_GRADE
WHERE MAT >= 90
ORDER BY CLASS_CD,
STUDENT_NO;
SELECT STUDENT_NM
FROM TB_GRADE
WHERE KOR >=90
UNION
SELECT STUDENT_NM
FROM TB_GRADE
WHERE ENG >=90;
SELECT STUDENT_NM
FROM TB_GRADE
WHERE KOR >= 90
UNION ALL
SELECT STUDENT_NM
FROM TB_GRADE
WHERE ENG >=90;
SELECT STUDENT_NM
FROM TB_GRADE
WHERE MAT >= 90
INTERSECT
SELECT STUDENT_NM
FROM TB_GRADE
WHERE KOR >= 90;
SELECT STUDENT_NM
FROM TB_GRADE
WHERE MAT >= 90
MINUS
SELECT STUDENT_NM
FROM TB_GRADE
WHERE KOR >= 90;