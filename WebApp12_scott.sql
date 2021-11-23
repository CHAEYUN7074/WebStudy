SELECT USER
FROM DUAL;
--==>> SCOTT

--�� ���� ���̺� ����
DROP TABLE TBL_MEMBER;
--==>> Table TBL_MEMBER��(��) �����Ǿ����ϴ�.

--�� ���̺� ����(TBL_MEMBER)
CREATE TABLE TBL_MEMBER
( SID   NUMBER
, NAME  VARCHAR2(30)    NOT NULL
, TEL   VARCHAR2(40)
, CONSTRAINT MEMBER_SID_PK PRIMARY KEY(SID)
);
--==>> Table TBL_MEMBER��(��) �����Ǿ����ϴ�.

--�� ���� ������ ����
DROP SEQUENCE MEMBERSEQ;
--==>> Sequence MEMBERSEQ��(��) �����Ǿ����ϴ�.

--�� ������ ����
CREATE SEQUENCE MEMBERSEQ
NOCACHE;
--==>> Sequence MEMBERSEQ��(��) �����Ǿ����ϴ�.

--�� ���� ������ �Է�(TBL_MEMBER)
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '��ҿ�', '010-1111-1111');
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '����ȭ', '010-2222-2222');
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '����ȣ', '010-3333-3333');
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '������', '010-4444-4444');
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '�̴ٿ�', '010-5555-5555');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 5

--�� Ȯ��
SELECT SID, NAME, TEL
FROM TBL_MEMBER
ORDER BY SID;
--> �� �� ����
SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY SID
;
--==>>
/*
1	��ҿ�	010-1111-1111
2	����ȭ	010-2222-2222
3	����ȣ	010-3333-3333
4	������	010-4444-4444
5	�̴ٿ�	010-5555-5555
*/

--�� �ο��� Ȯ��
SELECT COUNT(*) AS COUNT
FROM TBL_MEMBER;
--> �� �� ����
SELECT COUNT(*) AS COUNT FROM TBL_MEMBER
;
--==>> 5

--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.

--�� ȸ�� ���� �˻�(SID)
SELECT SID, NAME, TEL
FROM TBL_MEMBER
WHERE SID=1;
--> �� �� ����
SELECT SID, NAME, TEL FROM TBL_MEMBER WHERE SID=1
;
--==>> 1	��ҿ�	010-1111-1111

--�� ȸ������ ����
UPDATE TBL_MEMBER
SET NAME='�մ���', TEL='010-1100-1100'
WHERE SID=1;
--> �� �� ����
UPDATE TBL_MEMBER SET NAME='�մ���', TEL='010-1100-1100' WHERE SID=1
;
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.


--�� �ѹ�
ROLLBACK;
--==>> �ѹ� �Ϸ�.


--�� ȸ�� ���� ����
DELETE
FROM TBL_MEMBER
WHERE SID=1;
--> �� �� ����
DELETE FROM TBL_MEMBER WHERE SID=1
;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.

--�� �ѹ�
ROLLBACK;
--==>> �ѹ� �Ϸ�.

--�� ���� ���̺� ����
DROP TABLE TBL_SCORE;
--==>> Table TBL_SCORE��(��) �����Ǿ����ϴ�.


--�� ���̺� ����(TBL_MEMBERSCORE)
CREATE TABLE TBL_MEMBERSCORE
( SID   NUMBER
, KOR   NUMBER(3)
, ENG   NUMBER(3)
, MAT   NUMBER(3)
, CONSTRAINT MEMBERSCORE_SID_PK PRIMARY KEY(SID)
, CONSTRAINT MEMBERSCORE_KOR_CK CHECK(KOR BETWEEN 0 AND 100)
, CONSTRAINT MEMBERSCORE_ENG_CK CHECK(ENG BETWEEN 0 AND 100)
, CONSTRAINT MEMBERSCORE_MAT_CK CHECK(MAT BETWEEN 0 AND 100)
, CONSTRAINT MEMBERSCORE_SID_FK FOREIGN KEY(SID) 
             REFERENCES TBL_MEMBER(SID)
);
--==>> Table TBL_MEMBERSCORE��(��) �����Ǿ����ϴ�.

--�� ���� ������ �Է�
INSERT INTO TBL_MEMBERSCORE(SID, KOR, ENG, MAT) VALUES (1, 90, 80, 70);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_MEMBERSCORE(SID, KOR, ENG, MAT) VALUES (2, 80, 70, 60);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

--�� Ȯ��
SELECT SID, KOR, ENG, MAT
FROM TBL_MEMBERSCORE
ORDER BY SID;
--> �� �� ����
SELECT SID, KOR, ENG, MAT FROM TBL_MEMBERSCORE ORDER BY SID
;
--==>> 
/*
1	90	80	70
2	80	70	60
*/

--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.

--�� �Էµ� ���� ������ ���� Ȯ��
SELECT COUNT(*) AS COUNT
FROM TBL_MEMBERSCORE;
--> �� �� ����
SELECT COUNT(*) AS COUNT FROM TBL_MEMBERSCORE
;
--==>> 2

--�� ���� ������ ����
UPDATE TBL_MEMBERSCORE
SET KOR=91, ENG=81, MAT=71
WHERE SID=1;
--> �� �� ����
UPDATE TBL_MEMBERSCORE SET KOR=91, ENG=81, MAT=71 WHERE SID=1
;
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.

--�� Ȯ��
SELECT *
FROM TBL_MEMBERSCORE;
--==>>
/*
1	91	81	71
2	80	70	60
*/

--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.

--�� ���� ������ ����
DELETE
FROM TBL_MEMBERSCORE
WHERE SID=1;
--> �� �� ����
DELETE FROM TBL_MEMBERSCORE WHERE SID=1
;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.

--�� �ѹ�
ROLLBACK;
--==>> �ѹ� �Ϸ�.


--�� ��ü ����Ʈ ��ȸ ������ ����
SELECT M.SID, M.NAME, M.TEL, S.KOR, S.ENG, S.MAT
FROM TBL_MEMBER M, TBL_MEMBERSCORE S
WHERE M.SID = S.SID;
--==>>
/*
1	��ҿ�	010-1111-1111	91	81	71
2	����ȭ	010-2222-2222	80	70	60
*/

--�� ��ü ����Ʈ ��ȸ ������ ���� �� ���� �� LEFT JOIN
SELECT M.SID, M.NAME, M.TEL, S.KOR, S.ENG, S.MAT
FROM TBL_MEMBER M, TBL_MEMBERSCORE S
WHERE M.SID = S.SID(+);
--==>>
/*
1	��ҿ�	010-1111-1111	91	81	71
2	����ȭ	010-2222-2222	80	70	60
3	����ȣ	010-3333-3333			
4	������	010-4444-4444			
5	�̴ٿ�	010-5555-5555			
*/
--�� ��ü ����Ʈ ��ȸ ������ ���� �� ���� �� LEFT JOIN �� ���� �� NVL
SELECT M.SID, M.NAME, M.TEL
    , NVL(S.KOR,-1) AS KOR
    , NVL(S.ENG,-1) AS ENG
    , NVL(S.MAT,-1) AS MAT
FROM TBL_MEMBER M, TBL_MEMBERSCORE S
WHERE M.SID = S.SID(+);
--==>>
/*
1	��ҿ�	010-1111-1111	91	81	71
2	����ȭ	010-2222-2222	80	70	60
3	����ȣ	010-3333-3333	-1	-1	-1
4	������	010-4444-4444	-1	-1	-1
5	�̴ٿ�	010-5555-5555	-1	-1	-1
*/

--�� ��ü ����Ʈ ��ȸ ���� ��(VIEW_MEMBERSCORE)
CREATE OR REPLACE VIEW VIEW_MEMBERSCORE
AS
SELECT M.SID, M.NAME, M.TEL
    , NVL(S.KOR,-1) AS KOR
    , NVL(S.ENG,-1) AS ENG
    , NVL(S.MAT,-1) AS MAT
FROM TBL_MEMBER M, TBL_MEMBERSCORE S
WHERE M.SID = S.SID(+);
--==>> View VIEW_MEMBERSCORE��(��) �����Ǿ����ϴ�.

--�� ������ ��(VIEW_MEMBERSCORE)�� Ȱ���� ����Ʈ ��ȸ
SELECT SID, NAME, KOR, ENG, MAT
        , (KOR+ENG+MAT) AS TOT
        , ((KOR+ENG+MAT)/3) AS AVG
        , RANK() OVER(ORDER BY (KOR+ENG+MAT) DESC) AS RANK
FROM VIEW_MEMBERSCORE
ORDER BY SID;
--> �� �� ����
SELECT SID, NAME, KOR, ENG, MAT, (KOR+ENG+MAT) AS TOT, ((KOR+ENG+MAT)/3) AS AVG, RANK() OVER(ORDER BY (KOR+ENG+MAT) DESC) AS RANK FROM VIEW_MEMBERSCORE ORDER BY SID
;
--==>>
/*
1	��ҿ�	91	81	71	243	81	1
2	����ȭ	80	70	60	210	70	2
3	����ȣ	-1	-1	-1	-3	-1	3
4	������	-1	-1	-1	-3	-1	3
5	�̴ٿ�	-1	-1	-1	-3	-1	3
*/

--�� ������ ��(VIEW_MEMBERSCORE)�� Ȱ���� ��ȣ �˻�
-- ������ �� Ư���� �������� ã�Ƽ� �����Ҷ� �������̽��󿡼� �����ַ���
SELECT SID, NAME, KOR, ENG, MAT
FROM VIEW_MEMBERSCORE
WHERE SID=1;
--> �� �� ����
SELECT SID, NAME, KOR, ENG, MAT FROM VIEW_MEMBERSCORE WHERE SID=1
;
--==>> 1	��ҿ�	91	81	71


--�� ���������� ���ڵ� �� Ȯ��
-- 1�� �л��� ���������Ͱ� �ԷµǾ��ִ��� �ȵǾ��ִ��� Ȯ���ϱ� ����
-- 1�� ������ ���� �� ���� 0�� ������ ���� �� ����!
SELECT COUNT(*) AS COUNT
FROM TBL_MEMBERSCORE
WHERE SID=1;
--> �� �� ����
SELECT COUNT(*) AS COUNT FROM TBL_MEMBERSCORE WHERE SID=1
;
--==>> 1













