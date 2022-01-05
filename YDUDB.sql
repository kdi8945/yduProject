--------------------------------------------------------
--  파일이 생성됨 - 목요일-12월-30-2021   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence AL_NUM_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "AL_NUM_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999 INCREMENT BY 1 START WITH 120 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence B_NUM1_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "B_NUM1_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999 INCREMENT BY 1 START WITH 846 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence B_NUM2_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "B_NUM2_SEQ"  MINVALUE 1 MAXVALUE 999999 INCREMENT BY 1 START WITH 140 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence B_NUM3_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "B_NUM3_SEQ"  MINVALUE 1 MAXVALUE 99999999 INCREMENT BY 1 START WITH 120 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence B_NUM_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "B_NUM_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999 INCREMENT BY 1 START WITH 100 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence C_I_NUM_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "C_I_NUM_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999 INCREMENT BY 1 START WITH 61 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence C_NUM1_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "C_NUM1_SEQ"  MINVALUE 1 MAXVALUE 99999999 INCREMENT BY 1 START WITH 140 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence C_NUM2_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "C_NUM2_SEQ"  MINVALUE 1 MAXVALUE 9999999 INCREMENT BY 1 START WITH 140 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence C_NUM3_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "C_NUM3_SEQ"  MINVALUE 1 MAXVALUE 999999 INCREMENT BY 1 START WITH 100 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence C_NUM_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "C_NUM_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999 INCREMENT BY 1 START WITH 100 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence C_STU_NUM_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "C_STU_NUM_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999 INCREMENT BY 1 START WITH 200 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence PROF_RATE_NUM_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PROF_RATE_NUM_SEQ"  MINVALUE 1 MAXVALUE 99999 INCREMENT BY 1 START WITH 120 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence T_NUM_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "T_NUM_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999 INCREMENT BY 1 START WITH 40 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table AL_STATUS
--------------------------------------------------------

  CREATE TABLE "AL_STATUS" 
   (	"AL_NUM" NUMBER, 
	"C_NUM" NUMBER, 
	"STU_ID" VARCHAR2(30 BYTE), 
	"A_STATUS" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "AL_STATUS"."AL_NUM" IS '수강신청일련번호';
   COMMENT ON COLUMN "AL_STATUS"."C_NUM" IS '수업번호';
   COMMENT ON COLUMN "AL_STATUS"."STU_ID" IS '신청학생아이디';
   COMMENT ON COLUMN "AL_STATUS"."A_STATUS" IS '수강신청상태';
   COMMENT ON TABLE "AL_STATUS"  IS '수강신청학생상태';
--------------------------------------------------------
--  DDL for Table BOARD
--------------------------------------------------------

  CREATE TABLE "BOARD" 
   (	"B_NUM" NUMBER, 
	"B_TYPE" NUMBER, 
	"ID" VARCHAR2(30 BYTE), 
	"B_TITLE" VARCHAR2(300 BYTE), 
	"B_CONTENT" VARCHAR2(4000 BYTE), 
	"B_W_DATE" DATE, 
	"B_VIEW" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "BOARD"."B_NUM" IS '게시물번호';
   COMMENT ON COLUMN "BOARD"."B_TYPE" IS '게시물타입';
   COMMENT ON COLUMN "BOARD"."ID" IS '아이디';
   COMMENT ON COLUMN "BOARD"."B_TITLE" IS '게시물제목';
   COMMENT ON COLUMN "BOARD"."B_CONTENT" IS '게시물내용';
   COMMENT ON COLUMN "BOARD"."B_W_DATE" IS '작성일';
   COMMENT ON COLUMN "BOARD"."B_VIEW" IS '게시물조회수';
   COMMENT ON TABLE "BOARD"  IS '게시판테이블';
--------------------------------------------------------
--  DDL for Table B_COMMENT
--------------------------------------------------------

  CREATE TABLE "B_COMMENT" 
   (	"C_NUM" NUMBER, 
	"ID" VARCHAR2(30 BYTE), 
	"B_NUM" NUMBER, 
	"B_TYPE" NUMBER, 
	"C_CONTENT" VARCHAR2(4000 BYTE), 
	"C_W_DATE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "B_COMMENT"."C_NUM" IS '댓글번호';
   COMMENT ON COLUMN "B_COMMENT"."ID" IS '아이디';
   COMMENT ON COLUMN "B_COMMENT"."B_NUM" IS '게시물번호';
   COMMENT ON COLUMN "B_COMMENT"."B_TYPE" IS '게시물타입';
   COMMENT ON COLUMN "B_COMMENT"."C_CONTENT" IS '댓글내용';
   COMMENT ON COLUMN "B_COMMENT"."C_W_DATE" IS '댓글작성일';
   COMMENT ON TABLE "B_COMMENT"  IS '댓글테이블';
--------------------------------------------------------
--  DDL for Table B_RAO
--------------------------------------------------------

  CREATE TABLE "B_RAO" 
   (	"B_NUM" NUMBER, 
	"ID" VARCHAR2(30 BYTE), 
	"B_TYPE" NUMBER, 
	"B_RAO_STATUS" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "B_RAO"."B_NUM" IS '게시물번호';
   COMMENT ON COLUMN "B_RAO"."ID" IS '아이디';
   COMMENT ON COLUMN "B_RAO"."B_TYPE" IS '게시물타입';
   COMMENT ON COLUMN "B_RAO"."B_RAO_STATUS" IS '게시물추천반대상태';
   COMMENT ON TABLE "B_RAO"  IS '게시물추천반대';
--------------------------------------------------------
--  DDL for Table CODENUM
--------------------------------------------------------

  CREATE TABLE "CODENUM" 
   (	"L_CODE" NUMBER, 
	"M_CODE" NUMBER, 
	"TYPE_NAME" VARCHAR2(1000 BYTE), 
	"CREATE_ID" VARCHAR2(30 BYTE), 
	"CREATE_DATE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "CODENUM"."L_CODE" IS '대분류번호';
   COMMENT ON COLUMN "CODENUM"."M_CODE" IS '중분류번호';
   COMMENT ON COLUMN "CODENUM"."TYPE_NAME" IS '분류명';
   COMMENT ON COLUMN "CODENUM"."CREATE_ID" IS '생성자';
   COMMENT ON COLUMN "CODENUM"."CREATE_DATE" IS '생성일';
   COMMENT ON TABLE "CODENUM"  IS '공통코드번호';
--------------------------------------------------------
--  DDL for Table C_INFO
--------------------------------------------------------

  CREATE TABLE "C_INFO" 
   (	"C_I_NUM" NUMBER, 
	"C_NUM" NUMBER, 
	"STU_ID" VARCHAR2(30 BYTE), 
	"M_SCORE" NUMBER, 
	"F_SCORE" NUMBER, 
	"A_SCORE" NUMBER, 
	"INS_OPINION" VARCHAR2(4000 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "C_INFO"."C_I_NUM" IS '수업정보일련번호';
   COMMENT ON COLUMN "C_INFO"."C_NUM" IS '수업번호';
   COMMENT ON COLUMN "C_INFO"."STU_ID" IS '학생아이디';
   COMMENT ON COLUMN "C_INFO"."M_SCORE" IS '중간고사성적';
   COMMENT ON COLUMN "C_INFO"."F_SCORE" IS '기말고사성적';
   COMMENT ON COLUMN "C_INFO"."A_SCORE" IS '출석점수';
   COMMENT ON COLUMN "C_INFO"."INS_OPINION" IS '교수자의견';
   COMMENT ON TABLE "C_INFO"  IS '수업정보';
--------------------------------------------------------
--  DDL for Table C_RAO
--------------------------------------------------------

  CREATE TABLE "C_RAO" 
   (	"C_NUM" NUMBER, 
	"ID" VARCHAR2(30 BYTE), 
	"C_RAO_STATUS" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "C_RAO"."C_NUM" IS '댓글번호';
   COMMENT ON COLUMN "C_RAO"."ID" IS '아이디';
   COMMENT ON COLUMN "C_RAO"."C_RAO_STATUS" IS '댓글추천반대상태';
   COMMENT ON TABLE "C_RAO"  IS '댓글추천반대';
--------------------------------------------------------
--  DDL for Table C_STU_INFO
--------------------------------------------------------

  CREATE TABLE "C_STU_INFO" 
   (	"C_STU_NUM" NUMBER, 
	"STU_ID" VARCHAR2(30 BYTE), 
	"C_NUM" NUMBER, 
	"E_TIME" VARCHAR2(10 BYTE), 
	"CO_TIME" VARCHAR2(10 BYTE), 
	"ATTENDSTATUS" VARCHAR2(10 BYTE), 
	"ATTENDANCE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "C_STU_INFO"."C_STU_NUM" IS '출결일련번호';
   COMMENT ON COLUMN "C_STU_INFO"."STU_ID" IS '학생아이디';
   COMMENT ON COLUMN "C_STU_INFO"."C_NUM" IS '수업번호';
   COMMENT ON COLUMN "C_STU_INFO"."E_TIME" IS '입실일시';
   COMMENT ON COLUMN "C_STU_INFO"."CO_TIME" IS '퇴실일시';
   COMMENT ON COLUMN "C_STU_INFO"."ATTENDSTATUS" IS '출석상태';
   COMMENT ON COLUMN "C_STU_INFO"."ATTENDANCE" IS '출석일';
   COMMENT ON TABLE "C_STU_INFO"  IS '학생출결정보';
--------------------------------------------------------
--  DDL for Table MEMBERINFO
--------------------------------------------------------

  CREATE TABLE "MEMBERINFO" 
   (	"ID" VARCHAR2(30 BYTE), 
	"PW" VARCHAR2(45 BYTE), 
	"NAME" VARCHAR2(15 BYTE), 
	"EMAIL" VARCHAR2(100 BYTE), 
	"YDUCODE" NUMBER, 
	"AUTORITY" NUMBER, 
	"MEM_STATUS" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "MEMBERINFO"."ID" IS '아이디';
   COMMENT ON COLUMN "MEMBERINFO"."PW" IS '비밀번호';
   COMMENT ON COLUMN "MEMBERINFO"."NAME" IS '이름';
   COMMENT ON COLUMN "MEMBERINFO"."EMAIL" IS '이메일';
   COMMENT ON COLUMN "MEMBERINFO"."YDUCODE" IS '소속번호';
   COMMENT ON COLUMN "MEMBERINFO"."AUTORITY" IS '권한';
   COMMENT ON COLUMN "MEMBERINFO"."MEM_STATUS" IS '회원상태';
   COMMENT ON TABLE "MEMBERINFO"  IS '회원정보';
--------------------------------------------------------
--  DDL for Table PRE_C_INFO
--------------------------------------------------------

  CREATE TABLE "PRE_C_INFO" 
   (	"C_NUM" NUMBER, 
	"PRO_ID" VARCHAR2(30 BYTE), 
	"C_NAME" VARCHAR2(300 BYTE), 
	"C_OVERVIEW" VARCHAR2(4000 BYTE), 
	"C_RE_DATE" DATE, 
	"C_S_DATE" DATE, 
	"C_E_DATE" DATE, 
	"C_E_TIME" VARCHAR2(10 BYTE), 
	"C_CO_TIME" VARCHAR2(10 BYTE), 
	"S_CLOSED" NUMBER, 
	"C_STATUS" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "PRE_C_INFO"."C_NUM" IS '수업번호';
   COMMENT ON COLUMN "PRE_C_INFO"."PRO_ID" IS '교수아이디';
   COMMENT ON COLUMN "PRE_C_INFO"."C_NAME" IS '수업명';
   COMMENT ON COLUMN "PRE_C_INFO"."C_OVERVIEW" IS '수업개요';
   COMMENT ON COLUMN "PRE_C_INFO"."C_RE_DATE" IS '학생모집일';
   COMMENT ON COLUMN "PRE_C_INFO"."C_S_DATE" IS '수업시작일';
   COMMENT ON COLUMN "PRE_C_INFO"."C_E_DATE" IS '수업종료일';
   COMMENT ON COLUMN "PRE_C_INFO"."C_E_TIME" IS '수업시작시간';
   COMMENT ON COLUMN "PRE_C_INFO"."C_CO_TIME" IS '수업종료시간';
   COMMENT ON COLUMN "PRE_C_INFO"."S_CLOSED" IS '마감인원';
   COMMENT ON COLUMN "PRE_C_INFO"."C_STATUS" IS '수업상태';
   COMMENT ON TABLE "PRE_C_INFO"  IS '사전수업정보';
--------------------------------------------------------
--  DDL for Table PROFESSOR_RATE
--------------------------------------------------------

  CREATE TABLE "PROFESSOR_RATE" 
   (	"PROF_RATE_NUM" NUMBER, 
	"C_NUM" NUMBER, 
	"STU_ID" VARCHAR2(30 BYTE), 
	"PROF_RATES" NUMBER, 
	"RATE_CONTENT" VARCHAR2(4000 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "PROFESSOR_RATE"."PROF_RATE_NUM" IS '교수평가일련번호';
   COMMENT ON COLUMN "PROFESSOR_RATE"."C_NUM" IS '수업번호';
   COMMENT ON COLUMN "PROFESSOR_RATE"."STU_ID" IS '교수아이디';
   COMMENT ON COLUMN "PROFESSOR_RATE"."PROF_RATES" IS '교수평점';
   COMMENT ON COLUMN "PROFESSOR_RATE"."RATE_CONTENT" IS '교수평가의견';
   COMMENT ON TABLE "PROFESSOR_RATE"  IS '교수자평가';
--------------------------------------------------------
--  DDL for Table TERMS
--------------------------------------------------------

  CREATE TABLE "TERMS" 
   (	"T_NUM" NUMBER, 
	"T_CONTENT" VARCHAR2(4000 BYTE), 
	"T_NECESSARY" VARCHAR2(1 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "TERMS"."T_NUM" IS '약관항목분류번호';
   COMMENT ON COLUMN "TERMS"."T_CONTENT" IS '약관내용';
   COMMENT ON COLUMN "TERMS"."T_NECESSARY" IS '필수여부';
   COMMENT ON TABLE "TERMS"  IS '약관정보';
--------------------------------------------------------
--  DDL for Table T_C_HISTORY
--------------------------------------------------------

  CREATE TABLE "T_C_HISTORY" 
   (	"ID" VARCHAR2(30 BYTE), 
	"T_NUM" NUMBER, 
	"AGREE" VARCHAR2(1 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "T_C_HISTORY"."ID" IS '아이디';
   COMMENT ON COLUMN "T_C_HISTORY"."T_NUM" IS '약관항목분류번호';
   COMMENT ON COLUMN "T_C_HISTORY"."AGREE" IS '동의여부';
   COMMENT ON TABLE "T_C_HISTORY"  IS '약관동의이력';
REM INSERTING into AL_STATUS
SET DEFINE OFF;
Insert into AL_STATUS (AL_NUM,C_NUM,STU_ID,A_STATUS) values (42,16,'kd1',2);
Insert into AL_STATUS (AL_NUM,C_NUM,STU_ID,A_STATUS) values (43,1,'kd1',1);
Insert into AL_STATUS (AL_NUM,C_NUM,STU_ID,A_STATUS) values (44,38,'kd1',3);
Insert into AL_STATUS (AL_NUM,C_NUM,STU_ID,A_STATUS) values (1,2,'kd1',3);
Insert into AL_STATUS (AL_NUM,C_NUM,STU_ID,A_STATUS) values (62,3,'kd1',2);
Insert into AL_STATUS (AL_NUM,C_NUM,STU_ID,A_STATUS) values (10,10,'stest100',2);
Insert into AL_STATUS (AL_NUM,C_NUM,STU_ID,A_STATUS) values (11,10,'stest101',2);
Insert into AL_STATUS (AL_NUM,C_NUM,STU_ID,A_STATUS) values (12,10,'stest102',2);
Insert into AL_STATUS (AL_NUM,C_NUM,STU_ID,A_STATUS) values (40,16,'yr1',2);
Insert into AL_STATUS (AL_NUM,C_NUM,STU_ID,A_STATUS) values (41,1,'yr1',2);
Insert into AL_STATUS (AL_NUM,C_NUM,STU_ID,A_STATUS) values (13,10,'stest103',2);
Insert into AL_STATUS (AL_NUM,C_NUM,STU_ID,A_STATUS) values (14,10,'stest104',2);
Insert into AL_STATUS (AL_NUM,C_NUM,STU_ID,A_STATUS) values (15,10,'stest105',2);
Insert into AL_STATUS (AL_NUM,C_NUM,STU_ID,A_STATUS) values (16,10,'stest106',2);
Insert into AL_STATUS (AL_NUM,C_NUM,STU_ID,A_STATUS) values (17,10,'stest107',2);
Insert into AL_STATUS (AL_NUM,C_NUM,STU_ID,A_STATUS) values (18,10,'stest108',2);
Insert into AL_STATUS (AL_NUM,C_NUM,STU_ID,A_STATUS) values (19,10,'stest109',2);
Insert into AL_STATUS (AL_NUM,C_NUM,STU_ID,A_STATUS) values (45,38,'yr1',2);
Insert into AL_STATUS (AL_NUM,C_NUM,STU_ID,A_STATUS) values (46,37,'kd1',3);
Insert into AL_STATUS (AL_NUM,C_NUM,STU_ID,A_STATUS) values (47,11,'kd1',2);
Insert into AL_STATUS (AL_NUM,C_NUM,STU_ID,A_STATUS) values (60,8,'kd1',2);
Insert into AL_STATUS (AL_NUM,C_NUM,STU_ID,A_STATUS) values (68,16,'stest100',3);
Insert into AL_STATUS (AL_NUM,C_NUM,STU_ID,A_STATUS) values (66,36,'yr1',1);
Insert into AL_STATUS (AL_NUM,C_NUM,STU_ID,A_STATUS) values (2,6,'stest100',2);
Insert into AL_STATUS (AL_NUM,C_NUM,STU_ID,A_STATUS) values (67,36,'kd1',1);
Insert into AL_STATUS (AL_NUM,C_NUM,STU_ID,A_STATUS) values (3,6,'stest101',3);
Insert into AL_STATUS (AL_NUM,C_NUM,STU_ID,A_STATUS) values (4,6,'stest102',2);
Insert into AL_STATUS (AL_NUM,C_NUM,STU_ID,A_STATUS) values (5,6,'stest103',2);
Insert into AL_STATUS (AL_NUM,C_NUM,STU_ID,A_STATUS) values (6,6,'stest104',3);
Insert into AL_STATUS (AL_NUM,C_NUM,STU_ID,A_STATUS) values (69,60,'kd1',1);
Insert into AL_STATUS (AL_NUM,C_NUM,STU_ID,A_STATUS) values (71,61,'kd1',3);
Insert into AL_STATUS (AL_NUM,C_NUM,STU_ID,A_STATUS) values (72,70,'kd1',2);
Insert into AL_STATUS (AL_NUM,C_NUM,STU_ID,A_STATUS) values (73,71,'kd1',2);
Insert into AL_STATUS (AL_NUM,C_NUM,STU_ID,A_STATUS) values (74,72,'kd1',2);
Insert into AL_STATUS (AL_NUM,C_NUM,STU_ID,A_STATUS) values (75,73,'kd1',1);
Insert into AL_STATUS (AL_NUM,C_NUM,STU_ID,A_STATUS) values (76,74,'kd1',2);
Insert into AL_STATUS (AL_NUM,C_NUM,STU_ID,A_STATUS) values (77,73,'stest100',2);
Insert into AL_STATUS (AL_NUM,C_NUM,STU_ID,A_STATUS) values (78,73,'stest101',2);
Insert into AL_STATUS (AL_NUM,C_NUM,STU_ID,A_STATUS) values (79,73,'stest102',2);
Insert into AL_STATUS (AL_NUM,C_NUM,STU_ID,A_STATUS) values (80,73,'stest103',2);
Insert into AL_STATUS (AL_NUM,C_NUM,STU_ID,A_STATUS) values (81,73,'stest104',2);
Insert into AL_STATUS (AL_NUM,C_NUM,STU_ID,A_STATUS) values (82,73,'stest105',2);
Insert into AL_STATUS (AL_NUM,C_NUM,STU_ID,A_STATUS) values (83,73,'stest106',2);
Insert into AL_STATUS (AL_NUM,C_NUM,STU_ID,A_STATUS) values (84,73,'stest107',2);
Insert into AL_STATUS (AL_NUM,C_NUM,STU_ID,A_STATUS) values (85,73,'stest108',2);
Insert into AL_STATUS (AL_NUM,C_NUM,STU_ID,A_STATUS) values (86,73,'stest109',2);
Insert into AL_STATUS (AL_NUM,C_NUM,STU_ID,A_STATUS) values (100,66,'kd1',2);
REM INSERTING into BOARD
SET DEFINE OFF;
Insert into BOARD (B_NUM,B_TYPE,ID,B_TITLE,B_CONTENT,B_W_DATE,B_VIEW) values (1,1,'hailey','전체공지사항제목1','전체공시사항내용1',to_date('2021/11/25','YYYY/MM/DD'),71);
Insert into BOARD (B_NUM,B_TYPE,ID,B_TITLE,B_CONTENT,B_W_DATE,B_VIEW) values (2,1,'hailey','전체공지사항제목2','전체공시사항내용2',to_date('2021/11/25','YYYY/MM/DD'),4);
Insert into BOARD (B_NUM,B_TYPE,ID,B_TITLE,B_CONTENT,B_W_DATE,B_VIEW) values (3,1,'hailey','전체공지사항제목3','전체공시사항내용3',to_date('2021/11/25','YYYY/MM/DD'),77);
Insert into BOARD (B_NUM,B_TYPE,ID,B_TITLE,B_CONTENT,B_W_DATE,B_VIEW) values (4,1,'hailey','전체공지사항제목4','전체공시사항내용4',to_date('2021/11/25','YYYY/MM/DD'),22);
Insert into BOARD (B_NUM,B_TYPE,ID,B_TITLE,B_CONTENT,B_W_DATE,B_VIEW) values (5,1,'hailey','전체공지사항제목5','전체공시사항내용5',to_date('2021/11/25','YYYY/MM/DD'),38);
Insert into BOARD (B_NUM,B_TYPE,ID,B_TITLE,B_CONTENT,B_W_DATE,B_VIEW) values (6,1,'hailey','전체공지사항제목6','전체공시사항내용6',to_date('2021/11/29','YYYY/MM/DD'),145);
Insert into BOARD (B_NUM,B_TYPE,ID,B_TITLE,B_CONTENT,B_W_DATE,B_VIEW) values (111,2,'sweettk','수업공지사항 작성테스트4','수업공지사항 작성테스트4',to_date('2021/12/20','YYYY/MM/DD'),0);
Insert into BOARD (B_NUM,B_TYPE,ID,B_TITLE,B_CONTENT,B_W_DATE,B_VIEW) values (112,2,'sweettk','수업공지사항 작성테스트5','수업공지사항 작성테스트5',to_date('2021/12/20','YYYY/MM/DD'),0);
Insert into BOARD (B_NUM,B_TYPE,ID,B_TITLE,B_CONTENT,B_W_DATE,B_VIEW) values (113,2,'sweettk','수업공지사항 작성테스트6','수업공지사항 작성테스트6',to_date('2021/12/20','YYYY/MM/DD'),0);
Insert into BOARD (B_NUM,B_TYPE,ID,B_TITLE,B_CONTENT,B_W_DATE,B_VIEW) values (114,2,'sweettk','수업공지사항 작성테스트7','수업공지사항 작성테스트7',to_date('2021/12/20','YYYY/MM/DD'),0);
Insert into BOARD (B_NUM,B_TYPE,ID,B_TITLE,B_CONTENT,B_W_DATE,B_VIEW) values (115,2,'sweettk','수업공지사항 작성테스트8','수업공지사항 작성테스트8',to_date('2021/12/20','YYYY/MM/DD'),0);
Insert into BOARD (B_NUM,B_TYPE,ID,B_TITLE,B_CONTENT,B_W_DATE,B_VIEW) values (116,2,'sweettk','수업공지사항 작성테스트9','수업공지사항 작성테스트9',to_date('2021/12/20','YYYY/MM/DD'),0);
Insert into BOARD (B_NUM,B_TYPE,ID,B_TITLE,B_CONTENT,B_W_DATE,B_VIEW) values (117,2,'sweettk','수업공지사항 작성테스트10','수업공지사항 작성테스트10',to_date('2021/12/20','YYYY/MM/DD'),1);
Insert into BOARD (B_NUM,B_TYPE,ID,B_TITLE,B_CONTENT,B_W_DATE,B_VIEW) values (3,2,'hotht','수업공지사항제목3','수업공지사항내용3',to_date('2021/11/25','YYYY/MM/DD'),79);
Insert into BOARD (B_NUM,B_TYPE,ID,B_TITLE,B_CONTENT,B_W_DATE,B_VIEW) values (4,2,'hotht','수업공지사항제목4','수업공지사항내용4',to_date('2021/11/25','YYYY/MM/DD'),22);
Insert into BOARD (B_NUM,B_TYPE,ID,B_TITLE,B_CONTENT,B_W_DATE,B_VIEW) values (829,1,'hailey','전체공지사항테스트14','전체공지사항테스트14',to_date('2021/12/20','YYYY/MM/DD'),3);
Insert into BOARD (B_NUM,B_TYPE,ID,B_TITLE,B_CONTENT,B_W_DATE,B_VIEW) values (6,2,'sweettk','수업공지사항제목6','수업공지사항내용6',to_date('2021/11/29','YYYY/MM/DD'),53);
Insert into BOARD (B_NUM,B_TYPE,ID,B_TITLE,B_CONTENT,B_W_DATE,B_VIEW) values (118,2,'sweettk','수업공지사항 수정테스트2','수업공지사항 수정테스트2',to_date('2021/12/20','YYYY/MM/DD'),28);
Insert into BOARD (B_NUM,B_TYPE,ID,B_TITLE,B_CONTENT,B_W_DATE,B_VIEW) values (830,1,'hailey','전체공지사항테스트15','전체공지사항테스트15',to_date('2021/12/20','YYYY/MM/DD'),26);
Insert into BOARD (B_NUM,B_TYPE,ID,B_TITLE,B_CONTENT,B_W_DATE,B_VIEW) values (825,1,'hailey','전체공지사항제목9','전체공지사항제목9',to_date('2021/12/20','YYYY/MM/DD'),3);
Insert into BOARD (B_NUM,B_TYPE,ID,B_TITLE,B_CONTENT,B_W_DATE,B_VIEW) values (1,3,'yr1',null,'1번 수정 테스트',to_date('2021/12/17','YYYY/MM/DD'),0);
Insert into BOARD (B_NUM,B_TYPE,ID,B_TITLE,B_CONTENT,B_W_DATE,B_VIEW) values (2,3,'kd1',null,'대나무숲 내용2 입니다 테스트할거임',to_date('2021/12/02','YYYY/MM/DD'),0);
Insert into BOARD (B_NUM,B_TYPE,ID,B_TITLE,B_CONTENT,B_W_DATE,B_VIEW) values (3,3,'kd1',null,'대나무숲 내용3 입니다 테스트할거임',to_date('2021/12/03','YYYY/MM/DD'),0);
Insert into BOARD (B_NUM,B_TYPE,ID,B_TITLE,B_CONTENT,B_W_DATE,B_VIEW) values (4,3,'yr1',null,'대나무숲 내용4 입니다 테스트할거임',to_date('2021/12/04','YYYY/MM/DD'),0);
Insert into BOARD (B_NUM,B_TYPE,ID,B_TITLE,B_CONTENT,B_W_DATE,B_VIEW) values (7,3,'kd1',null,'대나무숲 내용7 입니다 테스트할거임',to_date('2021/12/15','YYYY/MM/DD'),0);
Insert into BOARD (B_NUM,B_TYPE,ID,B_TITLE,B_CONTENT,B_W_DATE,B_VIEW) values (8,3,'kd1','공내수','공내스',to_date('2021/12/20','YYYY/MM/DD'),74);
Insert into BOARD (B_NUM,B_TYPE,ID,B_TITLE,B_CONTENT,B_W_DATE,B_VIEW) values (9,3,'yr1','공지사항수정','수정테스트',to_date('2021/12/20','YYYY/MM/DD'),28);
Insert into BOARD (B_NUM,B_TYPE,ID,B_TITLE,B_CONTENT,B_W_DATE,B_VIEW) values (828,1,'hailey','전체공지사항테스트13','전체공지사항테스트13',to_date('2021/12/20','YYYY/MM/DD'),1);
Insert into BOARD (B_NUM,B_TYPE,ID,B_TITLE,B_CONTENT,B_W_DATE,B_VIEW) values (11,3,'yr1',null,'tttssssdd',to_date('2021/12/17','YYYY/MM/DD'),0);
Insert into BOARD (B_NUM,B_TYPE,ID,B_TITLE,B_CONTENT,B_W_DATE,B_VIEW) values (120,2,'sweettk','1222 수업공지작성','1222',to_date('2021/12/22','YYYY/MM/DD'),1);
Insert into BOARD (B_NUM,B_TYPE,ID,B_TITLE,B_CONTENT,B_W_DATE,B_VIEW) values (13,3,'kd1',null,'대나무숲 13번 수정입니다',to_date('2021/12/20','YYYY/MM/DD'),0);
Insert into BOARD (B_NUM,B_TYPE,ID,B_TITLE,B_CONTENT,B_W_DATE,B_VIEW) values (100,3,'kd1','수업공지사항 작성테스트1','수업공지사항 작성테스트2',to_date('2021/12/20','YYYY/MM/DD'),0);
Insert into BOARD (B_NUM,B_TYPE,ID,B_TITLE,B_CONTENT,B_W_DATE,B_VIEW) values (827,1,'hailey','전체공지사항테스트11','전체공지사항테스트11',to_date('2021/12/20','YYYY/MM/DD'),0);
Insert into BOARD (B_NUM,B_TYPE,ID,B_TITLE,B_CONTENT,B_W_DATE,B_VIEW) values (840,1,'hailey','전체공지작성','전체공지내용',to_date('2021/12/22','YYYY/MM/DD'),5);
REM INSERTING into B_COMMENT
SET DEFINE OFF;
Insert into B_COMMENT (C_NUM,ID,B_NUM,B_TYPE,C_CONTENT,C_W_DATE) values (41,'hailey',6,1,'test',to_date('2021/12/13','YYYY/MM/DD'));
Insert into B_COMMENT (C_NUM,ID,B_NUM,B_TYPE,C_CONTENT,C_W_DATE) values (112,'kd1',6,1,'전공수',to_date('2021/12/20','YYYY/MM/DD'));
Insert into B_COMMENT (C_NUM,ID,B_NUM,B_TYPE,C_CONTENT,C_W_DATE) values (1,'hailey',6,2,'수업 공지사항 댓글 수정1',to_date('2021/12/14','YYYY/MM/DD'));
Insert into B_COMMENT (C_NUM,ID,B_NUM,B_TYPE,C_CONTENT,C_W_DATE) values (116,'kd1',6,1,'작성tesst',to_date('2021/12/20','YYYY/MM/DD'));
Insert into B_COMMENT (C_NUM,ID,B_NUM,B_TYPE,C_CONTENT,C_W_DATE) values (122,'kd1',118,2,'수업공지댓글3',to_date('2021/12/20','YYYY/MM/DD'));
Insert into B_COMMENT (C_NUM,ID,B_NUM,B_TYPE,C_CONTENT,C_W_DATE) values (35,'hailey',6,1,'전체 공지 게시판 댓글2',to_date('2021/12/12','YYYY/MM/DD'));
Insert into B_COMMENT (C_NUM,ID,B_NUM,B_TYPE,C_CONTENT,C_W_DATE) values (36,'hailey',6,1,'전체 공지 게시판 댓글3',to_date('2021/12/12','YYYY/MM/DD'));
Insert into B_COMMENT (C_NUM,ID,B_NUM,B_TYPE,C_CONTENT,C_W_DATE) values (39,'hailey',6,1,'수정test',to_date('2021/12/14','YYYY/MM/DD'));
Insert into B_COMMENT (C_NUM,ID,B_NUM,B_TYPE,C_CONTENT,C_W_DATE) values (58,'sweettk',6,2,'수업 공지 게시판 댓글1',to_date('2021/12/14','YYYY/MM/DD'));
Insert into B_COMMENT (C_NUM,ID,B_NUM,B_TYPE,C_CONTENT,C_W_DATE) values (60,'hotht',6,2,'수업 공지 게시판 댓글3',to_date('2021/12/14','YYYY/MM/DD'));
Insert into B_COMMENT (C_NUM,ID,B_NUM,B_TYPE,C_CONTENT,C_W_DATE) values (61,'sweettk',6,2,'수업 공지 게시판 댓글4',to_date('2021/12/14','YYYY/MM/DD'));
Insert into B_COMMENT (C_NUM,ID,B_NUM,B_TYPE,C_CONTENT,C_W_DATE) values (119,'kd1',118,2,'수업공지댓글1수정1',to_date('2021/12/20','YYYY/MM/DD'));
Insert into B_COMMENT (C_NUM,ID,B_NUM,B_TYPE,C_CONTENT,C_W_DATE) values (121,'kd1',830,1,'수정테스트',to_date('2021/12/21','YYYY/MM/DD'));
Insert into B_COMMENT (C_NUM,ID,B_NUM,B_TYPE,C_CONTENT,C_W_DATE) values (118,'kd1',830,1,'전체공지댓글수정',to_date('2021/12/21','YYYY/MM/DD'));
Insert into B_COMMENT (C_NUM,ID,B_NUM,B_TYPE,C_CONTENT,C_W_DATE) values (123,'kd1',1,1,'?',to_date('2021/12/21','YYYY/MM/DD'));
Insert into B_COMMENT (C_NUM,ID,B_NUM,B_TYPE,C_CONTENT,C_W_DATE) values (125,'kd1',3,2,'수정댓글테스트',to_date('2021/12/21','YYYY/MM/DD'));
REM INSERTING into B_RAO
SET DEFINE OFF;
REM INSERTING into CODENUM
SET DEFINE OFF;
Insert into CODENUM (L_CODE,M_CODE,TYPE_NAME,CREATE_ID,CREATE_DATE) values (1,1,'학생','kkanbudi',to_date('2021/12/15','YYYY/MM/DD'));
Insert into CODENUM (L_CODE,M_CODE,TYPE_NAME,CREATE_ID,CREATE_DATE) values (1,2,'교수','kkanbudi',to_date('2021/12/15','YYYY/MM/DD'));
Insert into CODENUM (L_CODE,M_CODE,TYPE_NAME,CREATE_ID,CREATE_DATE) values (1,3,'슈퍼관리자','kkanbudi',to_date('2021/12/15','YYYY/MM/DD'));
Insert into CODENUM (L_CODE,M_CODE,TYPE_NAME,CREATE_ID,CREATE_DATE) values (1,999,'회원정보-권한','kkanbudi',to_date('2021/12/15','YYYY/MM/DD'));
Insert into CODENUM (L_CODE,M_CODE,TYPE_NAME,CREATE_ID,CREATE_DATE) values (2,1,'승인','hailey',to_date('2021/12/15','YYYY/MM/DD'));
Insert into CODENUM (L_CODE,M_CODE,TYPE_NAME,CREATE_ID,CREATE_DATE) values (2,2,'승인대기','hailey',to_date('2021/12/15','YYYY/MM/DD'));
Insert into CODENUM (L_CODE,M_CODE,TYPE_NAME,CREATE_ID,CREATE_DATE) values (2,3,'회원탈퇴','hailey',to_date('2021/12/15','YYYY/MM/DD'));
Insert into CODENUM (L_CODE,M_CODE,TYPE_NAME,CREATE_ID,CREATE_DATE) values (2,999,'회원정보-회원상태','hailey',to_date('2021/12/15','YYYY/MM/DD'));
Insert into CODENUM (L_CODE,M_CODE,TYPE_NAME,CREATE_ID,CREATE_DATE) values (3,1,'게시판테이블-전체 공지사항','kkanbudi',to_date('2021/12/15','YYYY/MM/DD'));
Insert into CODENUM (L_CODE,M_CODE,TYPE_NAME,CREATE_ID,CREATE_DATE) values (3,2,'게시판테이블-수업 내 공지사항','kkanbudi',to_date('2021/12/15','YYYY/MM/DD'));
Insert into CODENUM (L_CODE,M_CODE,TYPE_NAME,CREATE_ID,CREATE_DATE) values (3,3,'게시판테이블-대나무숲','kkanbudi',to_date('2021/12/15','YYYY/MM/DD'));
Insert into CODENUM (L_CODE,M_CODE,TYPE_NAME,CREATE_ID,CREATE_DATE) values (3,4,'게시판테이블-쪽지','kkanbudi',to_date('2021/12/15','YYYY/MM/DD'));
Insert into CODENUM (L_CODE,M_CODE,TYPE_NAME,CREATE_ID,CREATE_DATE) values (3,999,'게시판테이블-게시물타입','kkanbudi',to_date('2021/12/15','YYYY/MM/DD'));
Insert into CODENUM (L_CODE,M_CODE,TYPE_NAME,CREATE_ID,CREATE_DATE) values (4,1,'추천/반대취소','hailey',to_date('2021/12/15','YYYY/MM/DD'));
Insert into CODENUM (L_CODE,M_CODE,TYPE_NAME,CREATE_ID,CREATE_DATE) values (4,2,'게시물추천','hailey',to_date('2021/12/15','YYYY/MM/DD'));
Insert into CODENUM (L_CODE,M_CODE,TYPE_NAME,CREATE_ID,CREATE_DATE) values (4,3,'게시물반대','hailey',to_date('2021/12/15','YYYY/MM/DD'));
Insert into CODENUM (L_CODE,M_CODE,TYPE_NAME,CREATE_ID,CREATE_DATE) values (4,999,'게시물추천반대-게시물추천반대상태','hailey',to_date('2021/12/15','YYYY/MM/DD'));
Insert into CODENUM (L_CODE,M_CODE,TYPE_NAME,CREATE_ID,CREATE_DATE) values (5,1,'추천/반대취소','kkanbudi',to_date('2021/12/15','YYYY/MM/DD'));
Insert into CODENUM (L_CODE,M_CODE,TYPE_NAME,CREATE_ID,CREATE_DATE) values (5,2,'댓글추천','kkanbudi',to_date('2021/12/15','YYYY/MM/DD'));
Insert into CODENUM (L_CODE,M_CODE,TYPE_NAME,CREATE_ID,CREATE_DATE) values (5,3,'댓글반대','kkanbudi',to_date('2021/12/15','YYYY/MM/DD'));
Insert into CODENUM (L_CODE,M_CODE,TYPE_NAME,CREATE_ID,CREATE_DATE) values (5,999,'댓글추천반대-댓글추천반대상태','kkanbudi',to_date('2021/12/15','YYYY/MM/DD'));
Insert into CODENUM (L_CODE,M_CODE,TYPE_NAME,CREATE_ID,CREATE_DATE) values (6,1,'수업개설','hailey',to_date('2021/12/15','YYYY/MM/DD'));
Insert into CODENUM (L_CODE,M_CODE,TYPE_NAME,CREATE_ID,CREATE_DATE) values (6,2,'수업중','hailey',to_date('2021/12/15','YYYY/MM/DD'));
Insert into CODENUM (L_CODE,M_CODE,TYPE_NAME,CREATE_ID,CREATE_DATE) values (6,3,'수업종료','hailey',to_date('2021/12/15','YYYY/MM/DD'));
Insert into CODENUM (L_CODE,M_CODE,TYPE_NAME,CREATE_ID,CREATE_DATE) values (6,4,'수업취소','hailey',to_date('2021/12/15','YYYY/MM/DD'));
Insert into CODENUM (L_CODE,M_CODE,TYPE_NAME,CREATE_ID,CREATE_DATE) values (6,999,'사전수업정보-수업상태','hailey',to_date('2021/12/15','YYYY/MM/DD'));
Insert into CODENUM (L_CODE,M_CODE,TYPE_NAME,CREATE_ID,CREATE_DATE) values (7,1,'수강신청취소','kkanbudi',to_date('2021/12/15','YYYY/MM/DD'));
Insert into CODENUM (L_CODE,M_CODE,TYPE_NAME,CREATE_ID,CREATE_DATE) values (7,2,'수강신청','kkanbudi',to_date('2021/12/15','YYYY/MM/DD'));
Insert into CODENUM (L_CODE,M_CODE,TYPE_NAME,CREATE_ID,CREATE_DATE) values (7,3,'수강포기','kkanbudi',to_date('2021/12/15','YYYY/MM/DD'));
Insert into CODENUM (L_CODE,M_CODE,TYPE_NAME,CREATE_ID,CREATE_DATE) values (7,999,'수강신청학생상태-수강신청상태','kkanbudi',to_date('2021/12/15','YYYY/MM/DD'));
REM INSERTING into C_INFO
SET DEFINE OFF;
Insert into C_INFO (C_I_NUM,C_NUM,STU_ID,M_SCORE,F_SCORE,A_SCORE,INS_OPINION) values (3,16,'kd1',40,40,10,' ');
Insert into C_INFO (C_I_NUM,C_NUM,STU_ID,M_SCORE,F_SCORE,A_SCORE,INS_OPINION) values (23,10,'stest102',40,40,0,' ');
Insert into C_INFO (C_I_NUM,C_NUM,STU_ID,M_SCORE,F_SCORE,A_SCORE,INS_OPINION) values (21,10,'stest100',0,0,0,' ');
Insert into C_INFO (C_I_NUM,C_NUM,STU_ID,M_SCORE,F_SCORE,A_SCORE,INS_OPINION) values (4,16,'yr1',40,40,0,' ');
Insert into C_INFO (C_I_NUM,C_NUM,STU_ID,M_SCORE,F_SCORE,A_SCORE,INS_OPINION) values (22,10,'stest101',40,37,0,' ');
Insert into C_INFO (C_I_NUM,C_NUM,STU_ID,M_SCORE,F_SCORE,A_SCORE,INS_OPINION) values (24,10,'stest103',0,0,0,' ');
Insert into C_INFO (C_I_NUM,C_NUM,STU_ID,M_SCORE,F_SCORE,A_SCORE,INS_OPINION) values (25,10,'stest104',0,0,0,' ');
Insert into C_INFO (C_I_NUM,C_NUM,STU_ID,M_SCORE,F_SCORE,A_SCORE,INS_OPINION) values (26,10,'stest105',0,0,0,' ');
Insert into C_INFO (C_I_NUM,C_NUM,STU_ID,M_SCORE,F_SCORE,A_SCORE,INS_OPINION) values (27,10,'stest106',0,0,0,' ');
Insert into C_INFO (C_I_NUM,C_NUM,STU_ID,M_SCORE,F_SCORE,A_SCORE,INS_OPINION) values (28,10,'stest107',0,0,0,' ');
Insert into C_INFO (C_I_NUM,C_NUM,STU_ID,M_SCORE,F_SCORE,A_SCORE,INS_OPINION) values (29,10,'stest108',0,0,0,' ');
Insert into C_INFO (C_I_NUM,C_NUM,STU_ID,M_SCORE,F_SCORE,A_SCORE,INS_OPINION) values (30,10,'stest109',0,0,0,' ');
Insert into C_INFO (C_I_NUM,C_NUM,STU_ID,M_SCORE,F_SCORE,A_SCORE,INS_OPINION) values (31,3,'kd1',1,40,0,' ');
Insert into C_INFO (C_I_NUM,C_NUM,STU_ID,M_SCORE,F_SCORE,A_SCORE,INS_OPINION) values (35,6,'stest100',0,0,0,' ');
Insert into C_INFO (C_I_NUM,C_NUM,STU_ID,M_SCORE,F_SCORE,A_SCORE,INS_OPINION) values (36,6,'stest102',0,0,0,' ');
Insert into C_INFO (C_I_NUM,C_NUM,STU_ID,M_SCORE,F_SCORE,A_SCORE,INS_OPINION) values (34,16,'stest100',0,0,0,' ');
Insert into C_INFO (C_I_NUM,C_NUM,STU_ID,M_SCORE,F_SCORE,A_SCORE,INS_OPINION) values (37,6,'stest103',0,0,0,' ');
Insert into C_INFO (C_I_NUM,C_NUM,STU_ID,M_SCORE,F_SCORE,A_SCORE,INS_OPINION) values (38,37,'kd1',40,40,0,' ');
Insert into C_INFO (C_I_NUM,C_NUM,STU_ID,M_SCORE,F_SCORE,A_SCORE,INS_OPINION) values (39,11,'kd1',38,40,1.3,' ');
Insert into C_INFO (C_I_NUM,C_NUM,STU_ID,M_SCORE,F_SCORE,A_SCORE,INS_OPINION) values (40,38,'kd1',15,10,0,' ');
Insert into C_INFO (C_I_NUM,C_NUM,STU_ID,M_SCORE,F_SCORE,A_SCORE,INS_OPINION) values (41,38,'yr1',40,40,0,' ');
Insert into C_INFO (C_I_NUM,C_NUM,STU_ID,M_SCORE,F_SCORE,A_SCORE,INS_OPINION) values (42,1,'yr1',0,0,2.2,' ');
Insert into C_INFO (C_I_NUM,C_NUM,STU_ID,M_SCORE,F_SCORE,A_SCORE,INS_OPINION) values (43,61,'kd1',0,0,3.3,' ');
Insert into C_INFO (C_I_NUM,C_NUM,STU_ID,M_SCORE,F_SCORE,A_SCORE,INS_OPINION) values (44,74,'kd1',0,0,20,' ');
Insert into C_INFO (C_I_NUM,C_NUM,STU_ID,M_SCORE,F_SCORE,A_SCORE,INS_OPINION) values (45,72,'kd1',0,0,20,' ');
Insert into C_INFO (C_I_NUM,C_NUM,STU_ID,M_SCORE,F_SCORE,A_SCORE,INS_OPINION) values (46,71,'kd1',0,0,0,' ');
REM INSERTING into C_RAO
SET DEFINE OFF;
REM INSERTING into C_STU_INFO
SET DEFINE OFF;
Insert into C_STU_INFO (C_STU_NUM,STU_ID,C_NUM,E_TIME,CO_TIME,ATTENDSTATUS,ATTENDANCE) values (1,'yr1',1,null,null,'lateearly',to_date('2021/12/14','YYYY/MM/DD'));
Insert into C_STU_INFO (C_STU_NUM,STU_ID,C_NUM,E_TIME,CO_TIME,ATTENDSTATUS,ATTENDANCE) values (2,'yr1',16,'0907',null,null,to_date('2021/12/14','YYYY/MM/DD'));
Insert into C_STU_INFO (C_STU_NUM,STU_ID,C_NUM,E_TIME,CO_TIME,ATTENDSTATUS,ATTENDANCE) values (50,'yr1',1,null,null,null,to_date('2021/12/15','YYYY/MM/DD'));
Insert into C_STU_INFO (C_STU_NUM,STU_ID,C_NUM,E_TIME,CO_TIME,ATTENDSTATUS,ATTENDANCE) values (52,'yr1',16,'0900',null,null,to_date('2021/12/15','YYYY/MM/DD'));
Insert into C_STU_INFO (C_STU_NUM,STU_ID,C_NUM,E_TIME,CO_TIME,ATTENDSTATUS,ATTENDANCE) values (62,'kd1',16,'0234',null,null,to_date('2021/12/16','YYYY/MM/DD'));
Insert into C_STU_INFO (C_STU_NUM,STU_ID,C_NUM,E_TIME,CO_TIME,ATTENDSTATUS,ATTENDANCE) values (122,'kd1',8,'1654','1654','absent',to_date('2021/12/20','YYYY/MM/DD'));
Insert into C_STU_INFO (C_STU_NUM,STU_ID,C_NUM,E_TIME,CO_TIME,ATTENDSTATUS,ATTENDANCE) values (123,'kd1',3,null,null,null,to_date('2021/12/21','YYYY/MM/DD'));
Insert into C_STU_INFO (C_STU_NUM,STU_ID,C_NUM,E_TIME,CO_TIME,ATTENDSTATUS,ATTENDANCE) values (113,'kd1',37,'1243','1243','absent',to_date('2021/12/19','YYYY/MM/DD'));
Insert into C_STU_INFO (C_STU_NUM,STU_ID,C_NUM,E_TIME,CO_TIME,ATTENDSTATUS,ATTENDANCE) values (124,'kd1',11,null,null,null,to_date('2021/12/21','YYYY/MM/DD'));
Insert into C_STU_INFO (C_STU_NUM,STU_ID,C_NUM,E_TIME,CO_TIME,ATTENDSTATUS,ATTENDANCE) values (86,'kd1',11,'1243','1243','absent',to_date('2021/12/16','YYYY/MM/DD'));
Insert into C_STU_INFO (C_STU_NUM,STU_ID,C_NUM,E_TIME,CO_TIME,ATTENDSTATUS,ATTENDANCE) values (114,'stest100',16,'1350','1350','absent',to_date('2021/12/19','YYYY/MM/DD'));
Insert into C_STU_INFO (C_STU_NUM,STU_ID,C_NUM,E_TIME,CO_TIME,ATTENDSTATUS,ATTENDANCE) values (115,'kd1',16,null,null,null,to_date('2021/12/20','YYYY/MM/DD'));
Insert into C_STU_INFO (C_STU_NUM,STU_ID,C_NUM,E_TIME,CO_TIME,ATTENDSTATUS,ATTENDANCE) values (88,'kd1',11,null,null,null,to_date('2021/12/17','YYYY/MM/DD'));
Insert into C_STU_INFO (C_STU_NUM,STU_ID,C_NUM,E_TIME,CO_TIME,ATTENDSTATUS,ATTENDANCE) values (125,'kd1',8,null,null,null,to_date('2021/12/21','YYYY/MM/DD'));
Insert into C_STU_INFO (C_STU_NUM,STU_ID,C_NUM,E_TIME,CO_TIME,ATTENDSTATUS,ATTENDANCE) values (90,'kd1',16,'0855','1050','attend',to_date('2021/12/17','YYYY/MM/DD'));
Insert into C_STU_INFO (C_STU_NUM,STU_ID,C_NUM,E_TIME,CO_TIME,ATTENDSTATUS,ATTENDANCE) values (92,'yr1',38,null,null,null,to_date('2021/12/17','YYYY/MM/DD'));
Insert into C_STU_INFO (C_STU_NUM,STU_ID,C_NUM,E_TIME,CO_TIME,ATTENDSTATUS,ATTENDANCE) values (93,'yr1',16,null,null,null,to_date('2021/12/17','YYYY/MM/DD'));
Insert into C_STU_INFO (C_STU_NUM,STU_ID,C_NUM,E_TIME,CO_TIME,ATTENDSTATUS,ATTENDANCE) values (94,'kd1',3,'0039','0039','absent',to_date('2021/12/17','YYYY/MM/DD'));
Insert into C_STU_INFO (C_STU_NUM,STU_ID,C_NUM,E_TIME,CO_TIME,ATTENDSTATUS,ATTENDANCE) values (95,'yr1',37,null,null,null,to_date('2021/12/17','YYYY/MM/DD'));
Insert into C_STU_INFO (C_STU_NUM,STU_ID,C_NUM,E_TIME,CO_TIME,ATTENDSTATUS,ATTENDANCE) values (96,'kd1',16,'0857','1011','attend',to_date('2021/12/13','YYYY/MM/DD'));
Insert into C_STU_INFO (C_STU_NUM,STU_ID,C_NUM,E_TIME,CO_TIME,ATTENDSTATUS,ATTENDANCE) values (97,'kd1',16,'0857','1011','attend',to_date('2021/12/14','YYYY/MM/DD'));
Insert into C_STU_INFO (C_STU_NUM,STU_ID,C_NUM,E_TIME,CO_TIME,ATTENDSTATUS,ATTENDANCE) values (98,'kd1',16,'0905','0955','lateearly',to_date('2021/12/15','YYYY/MM/DD'));
Insert into C_STU_INFO (C_STU_NUM,STU_ID,C_NUM,E_TIME,CO_TIME,ATTENDSTATUS,ATTENDANCE) values (140,'kd1',3,null,null,null,to_date('2021/12/22','YYYY/MM/DD'));
Insert into C_STU_INFO (C_STU_NUM,STU_ID,C_NUM,E_TIME,CO_TIME,ATTENDSTATUS,ATTENDANCE) values (100,'kd1',3,null,null,null,to_date('2021/12/18','YYYY/MM/DD'));
Insert into C_STU_INFO (C_STU_NUM,STU_ID,C_NUM,E_TIME,CO_TIME,ATTENDSTATUS,ATTENDANCE) values (141,'kd1',8,null,null,null,to_date('2021/12/22','YYYY/MM/DD'));
Insert into C_STU_INFO (C_STU_NUM,STU_ID,C_NUM,E_TIME,CO_TIME,ATTENDSTATUS,ATTENDANCE) values (142,'kd1',11,'0900','2248','attend',to_date('2021/12/22','YYYY/MM/DD'));
Insert into C_STU_INFO (C_STU_NUM,STU_ID,C_NUM,E_TIME,CO_TIME,ATTENDSTATUS,ATTENDANCE) values (103,'kd1',11,null,null,null,to_date('2021/12/18','YYYY/MM/DD'));
Insert into C_STU_INFO (C_STU_NUM,STU_ID,C_NUM,E_TIME,CO_TIME,ATTENDSTATUS,ATTENDANCE) values (105,'kd1',16,null,null,null,to_date('2021/12/18','YYYY/MM/DD'));
Insert into C_STU_INFO (C_STU_NUM,STU_ID,C_NUM,E_TIME,CO_TIME,ATTENDSTATUS,ATTENDANCE) values (106,'kd1',16,null,null,null,to_date('2021/12/19','YYYY/MM/DD'));
Insert into C_STU_INFO (C_STU_NUM,STU_ID,C_NUM,E_TIME,CO_TIME,ATTENDSTATUS,ATTENDANCE) values (108,'kd1',3,'1244',null,null,to_date('2021/12/19','YYYY/MM/DD'));
Insert into C_STU_INFO (C_STU_NUM,STU_ID,C_NUM,E_TIME,CO_TIME,ATTENDSTATUS,ATTENDANCE) values (117,'kd1',3,null,null,null,to_date('2021/12/20','YYYY/MM/DD'));
Insert into C_STU_INFO (C_STU_NUM,STU_ID,C_NUM,E_TIME,CO_TIME,ATTENDSTATUS,ATTENDANCE) values (110,'kd1',11,null,null,null,to_date('2021/12/19','YYYY/MM/DD'));
Insert into C_STU_INFO (C_STU_NUM,STU_ID,C_NUM,E_TIME,CO_TIME,ATTENDSTATUS,ATTENDANCE) values (144,'kd1',61,'2225','2330','absent',to_date('2021/12/22','YYYY/MM/DD'));
Insert into C_STU_INFO (C_STU_NUM,STU_ID,C_NUM,E_TIME,CO_TIME,ATTENDSTATUS,ATTENDANCE) values (118,'kd1',37,'1107','1107','absent',to_date('2021/12/20','YYYY/MM/DD'));
Insert into C_STU_INFO (C_STU_NUM,STU_ID,C_NUM,E_TIME,CO_TIME,ATTENDSTATUS,ATTENDANCE) values (119,'kd1',11,'1646','1646','absent',to_date('2021/12/20','YYYY/MM/DD'));
Insert into C_STU_INFO (C_STU_NUM,STU_ID,C_NUM,E_TIME,CO_TIME,ATTENDSTATUS,ATTENDANCE) values (145,'kd1',70,null,null,null,to_date('2021/12/23','YYYY/MM/DD'));
Insert into C_STU_INFO (C_STU_NUM,STU_ID,C_NUM,E_TIME,CO_TIME,ATTENDSTATUS,ATTENDANCE) values (121,'kd1',38,'1609','2223','absent',to_date('2021/12/20','YYYY/MM/DD'));
Insert into C_STU_INFO (C_STU_NUM,STU_ID,C_NUM,E_TIME,CO_TIME,ATTENDSTATUS,ATTENDANCE) values (146,'kd1',71,'1301',null,null,to_date('2021/12/23','YYYY/MM/DD'));
Insert into C_STU_INFO (C_STU_NUM,STU_ID,C_NUM,E_TIME,CO_TIME,ATTENDSTATUS,ATTENDANCE) values (147,'kd1',72,'1050','1150','early',to_date('2021/12/23','YYYY/MM/DD'));
Insert into C_STU_INFO (C_STU_NUM,STU_ID,C_NUM,E_TIME,CO_TIME,ATTENDSTATUS,ATTENDANCE) values (160,'kd1',3,null,null,null,to_date('2021/12/27','YYYY/MM/DD'));
Insert into C_STU_INFO (C_STU_NUM,STU_ID,C_NUM,E_TIME,CO_TIME,ATTENDSTATUS,ATTENDANCE) values (149,'kd1',74,'1510','1555','lateearly',to_date('2021/12/23','YYYY/MM/DD'));
Insert into C_STU_INFO (C_STU_NUM,STU_ID,C_NUM,E_TIME,CO_TIME,ATTENDSTATUS,ATTENDANCE) values (153,'kd1',8,null,null,null,to_date('2021/12/23','YYYY/MM/DD'));
Insert into C_STU_INFO (C_STU_NUM,STU_ID,C_NUM,E_TIME,CO_TIME,ATTENDSTATUS,ATTENDANCE) values (152,'kd1',3,null,null,null,to_date('2021/12/23','YYYY/MM/DD'));
Insert into C_STU_INFO (C_STU_NUM,STU_ID,C_NUM,E_TIME,CO_TIME,ATTENDSTATUS,ATTENDANCE) values (154,'kd1',11,null,null,null,to_date('2021/12/23','YYYY/MM/DD'));
Insert into C_STU_INFO (C_STU_NUM,STU_ID,C_NUM,E_TIME,CO_TIME,ATTENDSTATUS,ATTENDANCE) values (156,'kd1',61,'0805','1001','attend',to_date('2021/12/23','YYYY/MM/DD'));
Insert into C_STU_INFO (C_STU_NUM,STU_ID,C_NUM,E_TIME,CO_TIME,ATTENDSTATUS,ATTENDANCE) values (157,'yr1',38,'0926','0926','absent',to_date('2021/12/23','YYYY/MM/DD'));
Insert into C_STU_INFO (C_STU_NUM,STU_ID,C_NUM,E_TIME,CO_TIME,ATTENDSTATUS,ATTENDANCE) values (182,'kd1',3,null,null,null,to_date('2021/12/29','YYYY/MM/DD'));
Insert into C_STU_INFO (C_STU_NUM,STU_ID,C_NUM,E_TIME,CO_TIME,ATTENDSTATUS,ATTENDANCE) values (165,'kd1',61,'1920','1920','absent',to_date('2021/12/27','YYYY/MM/DD'));
Insert into C_STU_INFO (C_STU_NUM,STU_ID,C_NUM,E_TIME,CO_TIME,ATTENDSTATUS,ATTENDANCE) values (180,'kd1',3,null,null,null,to_date('2021/12/28','YYYY/MM/DD'));
Insert into C_STU_INFO (C_STU_NUM,STU_ID,C_NUM,E_TIME,CO_TIME,ATTENDSTATUS,ATTENDANCE) values (181,'kd1',66,null,null,null,to_date('2021/12/28','YYYY/MM/DD'));
REM INSERTING into MEMBERINFO
SET DEFINE OFF;
Insert into MEMBERINFO (ID,PW,NAME,EMAIL,YDUCODE,AUTORITY,MEM_STATUS) values ('yr1','1234','안예리','yr1@naver.com',123456,1,1);
Insert into MEMBERINFO (ID,PW,NAME,EMAIL,YDUCODE,AUTORITY,MEM_STATUS) values ('kd1','1234','김동일','kd1@naver.com',567890,1,1);
Insert into MEMBERINFO (ID,PW,NAME,EMAIL,YDUCODE,AUTORITY,MEM_STATUS) values ('hailey','admin','관리자','admin@naver.com',999999,3,1);
Insert into MEMBERINFO (ID,PW,NAME,EMAIL,YDUCODE,AUTORITY,MEM_STATUS) values ('sweettk','1234','강태광교수','sweettk@naver.com',678901,2,1);
Insert into MEMBERINFO (ID,PW,NAME,EMAIL,YDUCODE,AUTORITY,MEM_STATUS) values ('hotht','1234','하현태교수','hothot@naver.com',678901,2,1);
Insert into MEMBERINFO (ID,PW,NAME,EMAIL,YDUCODE,AUTORITY,MEM_STATUS) values ('kkanbudi','admin','관리자','admind1@naver.com',999998,3,1);
Insert into MEMBERINFO (ID,PW,NAME,EMAIL,YDUCODE,AUTORITY,MEM_STATUS) values ('teststudentid','1234','testname','teststudent@naver.com',123123,1,1);
Insert into MEMBERINFO (ID,PW,NAME,EMAIL,YDUCODE,AUTORITY,MEM_STATUS) values ('testprofessorid','1234','테스트교수','testProfessor@naver.com',600000,2,2);
Insert into MEMBERINFO (ID,PW,NAME,EMAIL,YDUCODE,AUTORITY,MEM_STATUS) values ('withdrawid','1234','탈퇴회원','withdraw@naver.com',123456,1,3);
Insert into MEMBERINFO (ID,PW,NAME,EMAIL,YDUCODE,AUTORITY,MEM_STATUS) values ('testmore','1234','testmore','jung@k.com',111111,1,2);
Insert into MEMBERINFO (ID,PW,NAME,EMAIL,YDUCODE,AUTORITY,MEM_STATUS) values ('test4','1','1','teststudent@naver.com',123123,1,2);
Insert into MEMBERINFO (ID,PW,NAME,EMAIL,YDUCODE,AUTORITY,MEM_STATUS) values ('testid2','123','testname','jung@k.com',123123,1,2);
Insert into MEMBERINFO (ID,PW,NAME,EMAIL,YDUCODE,AUTORITY,MEM_STATUS) values ('test2','2','test2','teststudent@naver.com',123123,1,2);
Insert into MEMBERINFO (ID,PW,NAME,EMAIL,YDUCODE,AUTORITY,MEM_STATUS) values ('test3','123','testid','admin@naver.com',123123,1,2);
Insert into MEMBERINFO (ID,PW,NAME,EMAIL,YDUCODE,AUTORITY,MEM_STATUS) values ('stest100','1','stest100','test@test.test',111111,1,1);
Insert into MEMBERINFO (ID,PW,NAME,EMAIL,YDUCODE,AUTORITY,MEM_STATUS) values ('stest101','1','stest101','test@test.test',111111,1,1);
Insert into MEMBERINFO (ID,PW,NAME,EMAIL,YDUCODE,AUTORITY,MEM_STATUS) values ('stest102','1','stest102','test@test.test',111111,1,1);
Insert into MEMBERINFO (ID,PW,NAME,EMAIL,YDUCODE,AUTORITY,MEM_STATUS) values ('stest103','1','stest103','test@test.test',111111,1,1);
Insert into MEMBERINFO (ID,PW,NAME,EMAIL,YDUCODE,AUTORITY,MEM_STATUS) values ('stest104','1','stest104','test@test.test',111111,1,1);
Insert into MEMBERINFO (ID,PW,NAME,EMAIL,YDUCODE,AUTORITY,MEM_STATUS) values ('stest105','1','stest105','test@test.test',111111,1,1);
Insert into MEMBERINFO (ID,PW,NAME,EMAIL,YDUCODE,AUTORITY,MEM_STATUS) values ('stest106','1','stest106','test@test.test',111111,1,1);
Insert into MEMBERINFO (ID,PW,NAME,EMAIL,YDUCODE,AUTORITY,MEM_STATUS) values ('stest107','1','stest107','test@test.test',111111,1,1);
Insert into MEMBERINFO (ID,PW,NAME,EMAIL,YDUCODE,AUTORITY,MEM_STATUS) values ('stest108','1','stest108','test@test.test',111111,1,1);
Insert into MEMBERINFO (ID,PW,NAME,EMAIL,YDUCODE,AUTORITY,MEM_STATUS) values ('stest109','1','stest109','test@test.test',111111,1,1);
Insert into MEMBERINFO (ID,PW,NAME,EMAIL,YDUCODE,AUTORITY,MEM_STATUS) values ('stest110','1','stest110','test@test.test',111111,1,1);
Insert into MEMBERINFO (ID,PW,NAME,EMAIL,YDUCODE,AUTORITY,MEM_STATUS) values ('lastTestStudent','1234','테스트학생','teststudent@naver.com',599999,1,1);
Insert into MEMBERINFO (ID,PW,NAME,EMAIL,YDUCODE,AUTORITY,MEM_STATUS) values ('lastTestPro','1234','테스트교수','teststudent@naver.com',600000,2,1);
Insert into MEMBERINFO (ID,PW,NAME,EMAIL,YDUCODE,AUTORITY,MEM_STATUS) values ('test1000','1','testid','admin@naver.com',123123,1,1);
Insert into MEMBERINFO (ID,PW,NAME,EMAIL,YDUCODE,AUTORITY,MEM_STATUS) values ('test1001','1','testid','123@123.123',123123,1,1);
Insert into MEMBERINFO (ID,PW,NAME,EMAIL,YDUCODE,AUTORITY,MEM_STATUS) values ('teststudent','1234','김동일','teststudent@naver.com',123123,1,1);
Insert into MEMBERINFO (ID,PW,NAME,EMAIL,YDUCODE,AUTORITY,MEM_STATUS) values ('testprofessor','1234','안예리교수','admin@naver.com',600000,2,1);
Insert into MEMBERINFO (ID,PW,NAME,EMAIL,YDUCODE,AUTORITY,MEM_STATUS) values ('testprof','1','testname','ca2222@naver.com',600000,2,1);
REM INSERTING into PRE_C_INFO
SET DEFINE OFF;
Insert into PRE_C_INFO (C_NUM,PRO_ID,C_NAME,C_OVERVIEW,C_RE_DATE,C_S_DATE,C_E_DATE,C_E_TIME,C_CO_TIME,S_CLOSED,C_STATUS) values (1,'sweettk','1번째 수업','수업개요1',to_date('2021/12/08','YYYY/MM/DD'),to_date('2021/12/08','YYYY/MM/DD'),to_date('2021/12/16','YYYY/MM/DD'),'9','11',20,3);
Insert into PRE_C_INFO (C_NUM,PRO_ID,C_NAME,C_OVERVIEW,C_RE_DATE,C_S_DATE,C_E_DATE,C_E_TIME,C_CO_TIME,S_CLOSED,C_STATUS) values (3,'sweettk','3번째 수업','수업개요3',to_date('2021/12/08','YYYY/MM/DD'),to_date('2021/12/08','YYYY/MM/DD'),to_date('2021/12/31','YYYY/MM/DD'),'14','16',10,3);
Insert into PRE_C_INFO (C_NUM,PRO_ID,C_NAME,C_OVERVIEW,C_RE_DATE,C_S_DATE,C_E_DATE,C_E_TIME,C_CO_TIME,S_CLOSED,C_STATUS) values (2,'hotht','2번째 수업','수업개요2',to_date('2021/12/08','YYYY/MM/DD'),to_date('2021/12/08','YYYY/MM/DD'),to_date('2021/12/09','YYYY/MM/DD'),'10','13',30,1);
Insert into PRE_C_INFO (C_NUM,PRO_ID,C_NAME,C_OVERVIEW,C_RE_DATE,C_S_DATE,C_E_DATE,C_E_TIME,C_CO_TIME,S_CLOSED,C_STATUS) values (6,'sweettk','6번째 수업','수업개요6',to_date('2021/12/09','YYYY/MM/DD'),to_date('2021/12/09','YYYY/MM/DD'),to_date('2021/12/09','YYYY/MM/DD'),'09','10',10,2);
Insert into PRE_C_INFO (C_NUM,PRO_ID,C_NAME,C_OVERVIEW,C_RE_DATE,C_S_DATE,C_E_DATE,C_E_TIME,C_CO_TIME,S_CLOSED,C_STATUS) values (8,'sweettk','8번째 수업','수업개요8',to_date('2021/12/10','YYYY/MM/DD'),to_date('2021/12/10','YYYY/MM/DD'),to_date('2021/12/25','YYYY/MM/DD'),'11','12',10,1);
Insert into PRE_C_INFO (C_NUM,PRO_ID,C_NAME,C_OVERVIEW,C_RE_DATE,C_S_DATE,C_E_DATE,C_E_TIME,C_CO_TIME,S_CLOSED,C_STATUS) values (37,'sweettk','37번째 수업','test456',to_date('2021/12/01','YYYY/MM/DD'),to_date('2021/12/01','YYYY/MM/DD'),to_date('2021/12/25','YYYY/MM/DD'),'09','10',10,2);
Insert into PRE_C_INFO (C_NUM,PRO_ID,C_NAME,C_OVERVIEW,C_RE_DATE,C_S_DATE,C_E_DATE,C_E_TIME,C_CO_TIME,S_CLOSED,C_STATUS) values (7,'sweettk','7번째 수업','수업개요7',to_date('2021/12/09','YYYY/MM/DD'),to_date('2021/12/09','YYYY/MM/DD'),to_date('2021/12/09','YYYY/MM/DD'),'09','10',10,4);
Insert into PRE_C_INFO (C_NUM,PRO_ID,C_NAME,C_OVERVIEW,C_RE_DATE,C_S_DATE,C_E_DATE,C_E_TIME,C_CO_TIME,S_CLOSED,C_STATUS) values (10,'sweettk','10번째 수업','수정수업개요10',to_date('2021/12/09','YYYY/MM/DD'),to_date('2021/12/16','YYYY/MM/DD'),to_date('2021/12/17','YYYY/MM/DD'),'12','15',10,2);
Insert into PRE_C_INFO (C_NUM,PRO_ID,C_NAME,C_OVERVIEW,C_RE_DATE,C_S_DATE,C_E_DATE,C_E_TIME,C_CO_TIME,S_CLOSED,C_STATUS) values (11,'sweettk','11번째 수업','수정수업개요11',to_date('2021/12/09','YYYY/MM/DD'),to_date('2021/12/09','YYYY/MM/DD'),to_date('2021/12/23','YYYY/MM/DD'),'13','15',10,2);
Insert into PRE_C_INFO (C_NUM,PRO_ID,C_NAME,C_OVERVIEW,C_RE_DATE,C_S_DATE,C_E_DATE,C_E_TIME,C_CO_TIME,S_CLOSED,C_STATUS) values (38,'sweettk','38번째 수업','수정test',to_date('2021/12/16','YYYY/MM/DD'),to_date('2021/12/16','YYYY/MM/DD'),to_date('2021/12/30','YYYY/MM/DD'),'11','15',10,2);
Insert into PRE_C_INFO (C_NUM,PRO_ID,C_NAME,C_OVERVIEW,C_RE_DATE,C_S_DATE,C_E_DATE,C_E_TIME,C_CO_TIME,S_CLOSED,C_STATUS) values (16,'sweettk','16번째 수업','test',to_date('2021/12/13','YYYY/MM/DD'),to_date('2021/12/13','YYYY/MM/DD'),to_date('2021/12/20','YYYY/MM/DD'),'09','10',10,3);
Insert into PRE_C_INFO (C_NUM,PRO_ID,C_NAME,C_OVERVIEW,C_RE_DATE,C_S_DATE,C_E_DATE,C_E_TIME,C_CO_TIME,S_CLOSED,C_STATUS) values (36,'sweettk','36번째 수업','test123',to_date('2021/12/28','YYYY/MM/DD'),to_date('2021/12/29','YYYY/MM/DD'),to_date('2021/12/29','YYYY/MM/DD'),'09','10',10,1);
Insert into PRE_C_INFO (C_NUM,PRO_ID,C_NAME,C_OVERVIEW,C_RE_DATE,C_S_DATE,C_E_DATE,C_E_TIME,C_CO_TIME,S_CLOSED,C_STATUS) values (4,'hotht','4번째 수업','종료한수업개요4',to_date('2021/12/10','YYYY/MM/DD'),to_date('2021/12/10','YYYY/MM/DD'),to_date('2021/12/10','YYYY/MM/DD'),'09','10',10,3);
Insert into PRE_C_INFO (C_NUM,PRO_ID,C_NAME,C_OVERVIEW,C_RE_DATE,C_S_DATE,C_E_DATE,C_E_TIME,C_CO_TIME,S_CLOSED,C_STATUS) values (41,'sweettk','41번째 수업','test2',to_date('2022/01/01','YYYY/MM/DD'),to_date('2022/01/01','YYYY/MM/DD'),to_date('2022/01/01','YYYY/MM/DD'),'11','12',10,1);
Insert into PRE_C_INFO (C_NUM,PRO_ID,C_NAME,C_OVERVIEW,C_RE_DATE,C_S_DATE,C_E_DATE,C_E_TIME,C_CO_TIME,S_CLOSED,C_STATUS) values (60,'sweettk','21년 12월 20일 통합 테스트 수업(TK)','21년 12월 20일 통합 테스트 수업개요/21년 12월 20일 통합 테스트 수업개요/21년 12월 20일 통합 테스트 수업개요/21년 12월 20일 통합 테스트 수업개요/21년 12월 20일 통합 테스트 수업개요/21년 12월 20일 통합 테스트 수업개요/21년 12월 20일 통합 테스트 수업개요/21년 12월 20일 통합 테스트 수업개요/21년 12월 20일 통합 테스트 수업개요/21년 12월 20일 통합 테스트 수업개요/21년 12월 20일 통합 테스트 수업개요/21년 12월 20일 통합 테스트 수업개요/21년 12월 20일 통합 테스트 수업개요/21년 12월 20일 통합 테스트 수업개요/21년 12월 20일 통합 테스트 수업개요/21년 12월 20일 통합 테스트 수업개요/',to_date('2021/12/21','YYYY/MM/DD'),to_date('2021/12/21','YYYY/MM/DD'),to_date('2021/12/27','YYYY/MM/DD'),'17','18',10,1);
Insert into PRE_C_INFO (C_NUM,PRO_ID,C_NAME,C_OVERVIEW,C_RE_DATE,C_S_DATE,C_E_DATE,C_E_TIME,C_CO_TIME,S_CLOSED,C_STATUS) values (61,'hotht','21년 12월 20일 통합 테스트 수업(HT)','21년 12월 20일 통합 테스트 수업개요/21년 12월 20일 통합 테스트 수업개요/21년 12월 20일 통합 테스트 수업개요/21년 12월 20일 통합 테스트 수업개요/21년 12월 20일 통합 테스트 수업개요/21년 12월 20일 통합 테스트 수업개요/21년 12월 20일 통합 테스트 수업개요/21년 12월 20일 통합 테스트 수업개요/21년 12월 20일 통합 테스트 수업개요/21년 12월 20일 통합 테스트 수업개요/21년 12월 20일 통합 테스트 수업개요/21년 12월 20일 통합 테스트 수업개요/21년 12월 20일 통합 테스트 수업개요/21년 12월 20일 통합 테스트 수업개요/21년 12월 20일 통합 테스트 수업개요/21년 12월 20일 통합 테스트 수업개요/',to_date('2021/12/21','YYYY/MM/DD'),to_date('2021/12/21','YYYY/MM/DD'),to_date('2021/12/27','YYYY/MM/DD'),'09','10',10,2);
Insert into PRE_C_INFO (C_NUM,PRO_ID,C_NAME,C_OVERVIEW,C_RE_DATE,C_S_DATE,C_E_DATE,C_E_TIME,C_CO_TIME,S_CLOSED,C_STATUS) values (67,'testprofessor','자바프로그래밍','자바프로그래밍을 배워서 백앤드 개발자가 된다',to_date('2021/12/23','YYYY/MM/DD'),to_date('2021/12/23','YYYY/MM/DD'),to_date('2021/12/23','YYYY/MM/DD'),'09','10',10,1);
Insert into PRE_C_INFO (C_NUM,PRO_ID,C_NAME,C_OVERVIEW,C_RE_DATE,C_S_DATE,C_E_DATE,C_E_TIME,C_CO_TIME,S_CLOSED,C_STATUS) values (68,'testprofessor','자바프로그래밍2','자바를 배운다',to_date('2021/12/23','YYYY/MM/DD'),to_date('2021/12/23','YYYY/MM/DD'),to_date('2021/12/23','YYYY/MM/DD'),'11','12',10,1);
Insert into PRE_C_INFO (C_NUM,PRO_ID,C_NAME,C_OVERVIEW,C_RE_DATE,C_S_DATE,C_E_DATE,C_E_TIME,C_CO_TIME,S_CLOSED,C_STATUS) values (64,'sweettk','64번째 수업','3',to_date('2021/12/21','YYYY/MM/DD'),to_date('2021/12/27','YYYY/MM/DD'),to_date('2021/12/27','YYYY/MM/DD'),'09','10',10,4);
Insert into PRE_C_INFO (C_NUM,PRO_ID,C_NAME,C_OVERVIEW,C_RE_DATE,C_S_DATE,C_E_DATE,C_E_TIME,C_CO_TIME,S_CLOSED,C_STATUS) values (65,'sweettk','65번째 수업','2',to_date('2021/12/27','YYYY/MM/DD'),to_date('2021/12/28','YYYY/MM/DD'),to_date('2021/12/28','YYYY/MM/DD'),'09','10',10,1);
Insert into PRE_C_INFO (C_NUM,PRO_ID,C_NAME,C_OVERVIEW,C_RE_DATE,C_S_DATE,C_E_DATE,C_E_TIME,C_CO_TIME,S_CLOSED,C_STATUS) values (66,'sweettk','66번째 수업','test',to_date('2021/12/27','YYYY/MM/DD'),to_date('2021/12/28','YYYY/MM/DD'),to_date('2021/12/28','YYYY/MM/DD'),'09','10',10,1);
Insert into PRE_C_INFO (C_NUM,PRO_ID,C_NAME,C_OVERVIEW,C_RE_DATE,C_S_DATE,C_E_DATE,C_E_TIME,C_CO_TIME,S_CLOSED,C_STATUS) values (69,'testprofessor','자바프로그래밍3','자바를 배운다',to_date('2021/12/23','YYYY/MM/DD'),to_date('2021/12/23','YYYY/MM/DD'),to_date('2021/12/23','YYYY/MM/DD'),'14','15',10,1);
Insert into PRE_C_INFO (C_NUM,PRO_ID,C_NAME,C_OVERVIEW,C_RE_DATE,C_S_DATE,C_E_DATE,C_E_TIME,C_CO_TIME,S_CLOSED,C_STATUS) values (70,'testprofessor','자바프로그래밍4','자바를 배운다',to_date('2021/12/23','YYYY/MM/DD'),to_date('2021/12/23','YYYY/MM/DD'),to_date('2021/12/23','YYYY/MM/DD'),'16','17',10,1);
Insert into PRE_C_INFO (C_NUM,PRO_ID,C_NAME,C_OVERVIEW,C_RE_DATE,C_S_DATE,C_E_DATE,C_E_TIME,C_CO_TIME,S_CLOSED,C_STATUS) values (71,'hotht','지각처리 예정 과목','지각예정',to_date('2021/12/23','YYYY/MM/DD'),to_date('2021/12/23','YYYY/MM/DD'),to_date('2021/12/23','YYYY/MM/DD'),'13','14',10,2);
Insert into PRE_C_INFO (C_NUM,PRO_ID,C_NAME,C_OVERVIEW,C_RE_DATE,C_S_DATE,C_E_DATE,C_E_TIME,C_CO_TIME,S_CLOSED,C_STATUS) values (72,'hotht','조퇴처리 예정 과목','조퇴예정',to_date('2021/12/23','YYYY/MM/DD'),to_date('2021/12/23','YYYY/MM/DD'),to_date('2021/12/23','YYYY/MM/DD'),'11','12',10,2);
Insert into PRE_C_INFO (C_NUM,PRO_ID,C_NAME,C_OVERVIEW,C_RE_DATE,C_S_DATE,C_E_DATE,C_E_TIME,C_CO_TIME,S_CLOSED,C_STATUS) values (73,'hotht','모집인원 마감 과목','모집인원 마감',to_date('2021/12/23','YYYY/MM/DD'),to_date('2021/12/23','YYYY/MM/DD'),to_date('2021/12/23','YYYY/MM/DD'),'17','18',10,1);
Insert into PRE_C_INFO (C_NUM,PRO_ID,C_NAME,C_OVERVIEW,C_RE_DATE,C_S_DATE,C_E_DATE,C_E_TIME,C_CO_TIME,S_CLOSED,C_STATUS) values (74,'hotht','지각 및 조퇴 처리 과목','지각 및 조퇴 처리',to_date('2021/12/23','YYYY/MM/DD'),to_date('2021/12/23','YYYY/MM/DD'),to_date('2021/12/23','YYYY/MM/DD'),'15','16',10,2);
REM INSERTING into PROFESSOR_RATE
SET DEFINE OFF;
Insert into PROFESSOR_RATE (PROF_RATE_NUM,C_NUM,STU_ID,PROF_RATES,RATE_CONTENT) values (1,1,'yr1',4,'유쾌하시고 수업을 잘 가르치십니다.');
Insert into PROFESSOR_RATE (PROF_RATE_NUM,C_NUM,STU_ID,PROF_RATES,RATE_CONTENT) values (2,1,'stest100',3,'학생들 한명 한명씩 꼼꼼하게 잘 지도해주셨습니다');
Insert into PROFESSOR_RATE (PROF_RATE_NUM,C_NUM,STU_ID,PROF_RATES,RATE_CONTENT) values (3,1,'stest101',3,'정말 알차고 보람있었던 시간이었습니다');
Insert into PROFESSOR_RATE (PROF_RATE_NUM,C_NUM,STU_ID,PROF_RATES,RATE_CONTENT) values (4,1,'stest102',5,'실무에서의 이야기와 실무에서 많이 쓰이는 방식들을 가르쳐주셔서 좋았습니다.');
Insert into PROFESSOR_RATE (PROF_RATE_NUM,C_NUM,STU_ID,PROF_RATES,RATE_CONTENT) values (5,1,'stest103',3,'짧은기간 많은 것을 가르쳐 주셨습니다. 추천합니다');
Insert into PROFESSOR_RATE (PROF_RATE_NUM,C_NUM,STU_ID,PROF_RATES,RATE_CONTENT) values (6,3,'kd1',1,'classContent에서 평가수정 테스트');
Insert into PROFESSOR_RATE (PROF_RATE_NUM,C_NUM,STU_ID,PROF_RATES,RATE_CONTENT) values (7,3,'stest100',5,'지루하지 않고 재밌게 강의하셔서 만족스러웠습니다');
Insert into PROFESSOR_RATE (PROF_RATE_NUM,C_NUM,STU_ID,PROF_RATES,RATE_CONTENT) values (8,3,'stest101',2,'학생들의 의도와 요구를 수용하려하시며 그에 맞는 기술을 순식간에 생각해내어 작업의 실무 팁을 알려주실 때 항상 열려있는 마인드를 가지신 분 이셨습니다');
Insert into PROFESSOR_RATE (PROF_RATE_NUM,C_NUM,STU_ID,PROF_RATES,RATE_CONTENT) values (9,3,'stest102',5,'책임감 있게 수업을 운영하고 이끌어 주셨습니다');
Insert into PROFESSOR_RATE (PROF_RATE_NUM,C_NUM,STU_ID,PROF_RATES,RATE_CONTENT) values (10,3,'stest103',2,'시간이 길다 보니 지루할 수 있는 수업일수도 있었지만 교수님의 유머와 함께 즐겁게 수업을 들을 수 있었습니다');
REM INSERTING into TERMS
SET DEFINE OFF;
Insert into TERMS (T_NUM,T_CONTENT,T_NECESSARY) values (1,'필수약관내용1','Y');
Insert into TERMS (T_NUM,T_CONTENT,T_NECESSARY) values (2,'필수약관내용2','Y');
Insert into TERMS (T_NUM,T_CONTENT,T_NECESSARY) values (3,'필수약관내용3','Y');
Insert into TERMS (T_NUM,T_CONTENT,T_NECESSARY) values (4,'선택약관내용1','N');
Insert into TERMS (T_NUM,T_CONTENT,T_NECESSARY) values (5,'선택약관내용2','N');
REM INSERTING into T_C_HISTORY
SET DEFINE OFF;
Insert into T_C_HISTORY (ID,T_NUM,AGREE) values ('hailey',1,'y');
Insert into T_C_HISTORY (ID,T_NUM,AGREE) values ('hailey',2,'y');
Insert into T_C_HISTORY (ID,T_NUM,AGREE) values ('hailey',3,'y');
Insert into T_C_HISTORY (ID,T_NUM,AGREE) values ('hailey',4,'y');
Insert into T_C_HISTORY (ID,T_NUM,AGREE) values ('hailey',5,'y');
Insert into T_C_HISTORY (ID,T_NUM,AGREE) values ('teststudentid',1,'Y');
Insert into T_C_HISTORY (ID,T_NUM,AGREE) values ('teststudentid',2,'Y');
Insert into T_C_HISTORY (ID,T_NUM,AGREE) values ('teststudentid',3,'Y');
Insert into T_C_HISTORY (ID,T_NUM,AGREE) values ('teststudentid',4,'N');
Insert into T_C_HISTORY (ID,T_NUM,AGREE) values ('teststudentid',5,'Y');
Insert into T_C_HISTORY (ID,T_NUM,AGREE) values ('testprofessorid',1,'Y');
Insert into T_C_HISTORY (ID,T_NUM,AGREE) values ('testprofessorid',2,'Y');
Insert into T_C_HISTORY (ID,T_NUM,AGREE) values ('testprofessorid',3,'Y');
Insert into T_C_HISTORY (ID,T_NUM,AGREE) values ('testprofessorid',4,'N');
Insert into T_C_HISTORY (ID,T_NUM,AGREE) values ('testprofessorid',5,'N');
Insert into T_C_HISTORY (ID,T_NUM,AGREE) values ('testmore',1,'Y');
Insert into T_C_HISTORY (ID,T_NUM,AGREE) values ('testmore',2,'Y');
Insert into T_C_HISTORY (ID,T_NUM,AGREE) values ('testmore',3,'Y');
Insert into T_C_HISTORY (ID,T_NUM,AGREE) values ('testmore',4,'N');
Insert into T_C_HISTORY (ID,T_NUM,AGREE) values ('testmore',5,'N');
Insert into T_C_HISTORY (ID,T_NUM,AGREE) values ('testid2',1,'Y');
Insert into T_C_HISTORY (ID,T_NUM,AGREE) values ('testid2',2,'Y');
Insert into T_C_HISTORY (ID,T_NUM,AGREE) values ('testid2',3,'Y');
Insert into T_C_HISTORY (ID,T_NUM,AGREE) values ('testid2',4,'N');
Insert into T_C_HISTORY (ID,T_NUM,AGREE) values ('testid2',5,'Y');
Insert into T_C_HISTORY (ID,T_NUM,AGREE) values ('lastTestStudent',1,'Y');
Insert into T_C_HISTORY (ID,T_NUM,AGREE) values ('lastTestStudent',2,'Y');
Insert into T_C_HISTORY (ID,T_NUM,AGREE) values ('lastTestStudent',3,'Y');
Insert into T_C_HISTORY (ID,T_NUM,AGREE) values ('lastTestStudent',4,'Y');
Insert into T_C_HISTORY (ID,T_NUM,AGREE) values ('lastTestStudent',5,'Y');
Insert into T_C_HISTORY (ID,T_NUM,AGREE) values ('lastTestPro',1,'Y');
Insert into T_C_HISTORY (ID,T_NUM,AGREE) values ('lastTestPro',2,'Y');
Insert into T_C_HISTORY (ID,T_NUM,AGREE) values ('lastTestPro',3,'Y');
Insert into T_C_HISTORY (ID,T_NUM,AGREE) values ('lastTestPro',4,'N');
Insert into T_C_HISTORY (ID,T_NUM,AGREE) values ('lastTestPro',5,'N');
Insert into T_C_HISTORY (ID,T_NUM,AGREE) values ('test1000',1,'Y');
Insert into T_C_HISTORY (ID,T_NUM,AGREE) values ('test1000',2,'Y');
Insert into T_C_HISTORY (ID,T_NUM,AGREE) values ('test1000',3,'Y');
Insert into T_C_HISTORY (ID,T_NUM,AGREE) values ('test1000',4,'N');
Insert into T_C_HISTORY (ID,T_NUM,AGREE) values ('test1000',5,'N');
Insert into T_C_HISTORY (ID,T_NUM,AGREE) values ('test1001',1,'Y');
Insert into T_C_HISTORY (ID,T_NUM,AGREE) values ('test1001',2,'Y');
Insert into T_C_HISTORY (ID,T_NUM,AGREE) values ('test1001',3,'Y');
Insert into T_C_HISTORY (ID,T_NUM,AGREE) values ('test1001',4,'N');
Insert into T_C_HISTORY (ID,T_NUM,AGREE) values ('test1001',5,'N');
Insert into T_C_HISTORY (ID,T_NUM,AGREE) values ('teststudent',1,'Y');
Insert into T_C_HISTORY (ID,T_NUM,AGREE) values ('teststudent',2,'Y');
Insert into T_C_HISTORY (ID,T_NUM,AGREE) values ('teststudent',3,'Y');
Insert into T_C_HISTORY (ID,T_NUM,AGREE) values ('teststudent',4,'Y');
Insert into T_C_HISTORY (ID,T_NUM,AGREE) values ('teststudent',5,'Y');
Insert into T_C_HISTORY (ID,T_NUM,AGREE) values ('testprofessor',1,'Y');
Insert into T_C_HISTORY (ID,T_NUM,AGREE) values ('testprofessor',2,'Y');
Insert into T_C_HISTORY (ID,T_NUM,AGREE) values ('testprofessor',3,'Y');
Insert into T_C_HISTORY (ID,T_NUM,AGREE) values ('testprofessor',4,'N');
Insert into T_C_HISTORY (ID,T_NUM,AGREE) values ('testprofessor',5,'N');
Insert into T_C_HISTORY (ID,T_NUM,AGREE) values ('testprof',1,'Y');
Insert into T_C_HISTORY (ID,T_NUM,AGREE) values ('testprof',2,'Y');
Insert into T_C_HISTORY (ID,T_NUM,AGREE) values ('testprof',3,'Y');
Insert into T_C_HISTORY (ID,T_NUM,AGREE) values ('testprof',4,'Y');
Insert into T_C_HISTORY (ID,T_NUM,AGREE) values ('testprof',5,'N');
--------------------------------------------------------
--  DDL for Index PK_BOARD
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_BOARD" ON "BOARD" ("B_NUM", "B_TYPE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_T_C_HISTORY
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_T_C_HISTORY" ON "T_C_HISTORY" ("ID", "T_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_C_STU_INFO
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_C_STU_INFO" ON "C_STU_INFO" ("C_STU_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_B_RAO
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_B_RAO" ON "B_RAO" ("B_NUM", "ID", "B_TYPE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_CODENUM
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_CODENUM" ON "CODENUM" ("L_CODE", "M_CODE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_AL_STATUS
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_AL_STATUS" ON "AL_STATUS" ("AL_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_MEMBERINFO
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_MEMBERINFO" ON "MEMBERINFO" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_TERMS
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_TERMS" ON "TERMS" ("T_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_PRO_EVAL
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_PRO_EVAL" ON "PROFESSOR_RATE" ("PROF_RATE_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_C_RAO
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_C_RAO" ON "C_RAO" ("C_NUM", "ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_B_COMMENT
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_B_COMMENT" ON "B_COMMENT" ("C_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_PRE_C_INFO
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_PRE_C_INFO" ON "PRE_C_INFO" ("C_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_C_INFO
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_C_INFO" ON "C_INFO" ("C_I_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table C_RAO
--------------------------------------------------------

  ALTER TABLE "C_RAO" ADD CONSTRAINT "PK_C_RAO" PRIMARY KEY ("C_NUM", "ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "C_RAO" MODIFY ("C_RAO_STATUS" NOT NULL ENABLE);
  ALTER TABLE "C_RAO" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "C_RAO" MODIFY ("C_NUM" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BOARD
--------------------------------------------------------

  ALTER TABLE "BOARD" ADD CONSTRAINT "PK_BOARD" PRIMARY KEY ("B_NUM", "B_TYPE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "BOARD" MODIFY ("B_VIEW" NOT NULL ENABLE);
  ALTER TABLE "BOARD" MODIFY ("B_W_DATE" NOT NULL ENABLE);
  ALTER TABLE "BOARD" MODIFY ("B_CONTENT" NOT NULL ENABLE);
  ALTER TABLE "BOARD" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "BOARD" MODIFY ("B_TYPE" NOT NULL ENABLE);
  ALTER TABLE "BOARD" MODIFY ("B_NUM" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CODENUM
--------------------------------------------------------

  ALTER TABLE "CODENUM" ADD CONSTRAINT "PK_CODENUM" PRIMARY KEY ("L_CODE", "M_CODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "CODENUM" MODIFY ("CREATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "CODENUM" MODIFY ("CREATE_ID" NOT NULL ENABLE);
  ALTER TABLE "CODENUM" MODIFY ("TYPE_NAME" NOT NULL ENABLE);
  ALTER TABLE "CODENUM" MODIFY ("M_CODE" NOT NULL ENABLE);
  ALTER TABLE "CODENUM" MODIFY ("L_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TERMS
--------------------------------------------------------

  ALTER TABLE "TERMS" ADD CONSTRAINT "PK_TERMS" PRIMARY KEY ("T_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "TERMS" MODIFY ("T_NECESSARY" NOT NULL ENABLE);
  ALTER TABLE "TERMS" MODIFY ("T_CONTENT" NOT NULL ENABLE);
  ALTER TABLE "TERMS" MODIFY ("T_NUM" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table AL_STATUS
--------------------------------------------------------

  ALTER TABLE "AL_STATUS" ADD CONSTRAINT "PK_AL_STATUS" PRIMARY KEY ("AL_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "AL_STATUS" MODIFY ("A_STATUS" NOT NULL ENABLE);
  ALTER TABLE "AL_STATUS" MODIFY ("STU_ID" NOT NULL ENABLE);
  ALTER TABLE "AL_STATUS" MODIFY ("C_NUM" NOT NULL ENABLE);
  ALTER TABLE "AL_STATUS" MODIFY ("AL_NUM" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PROFESSOR_RATE
--------------------------------------------------------

  ALTER TABLE "PROFESSOR_RATE" ADD CONSTRAINT "PK_PRO_EVAL" PRIMARY KEY ("PROF_RATE_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "PROFESSOR_RATE" MODIFY ("PROF_RATES" NOT NULL ENABLE);
  ALTER TABLE "PROFESSOR_RATE" MODIFY ("STU_ID" NOT NULL ENABLE);
  ALTER TABLE "PROFESSOR_RATE" MODIFY ("C_NUM" NOT NULL ENABLE);
  ALTER TABLE "PROFESSOR_RATE" MODIFY ("PROF_RATE_NUM" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PRE_C_INFO
--------------------------------------------------------

  ALTER TABLE "PRE_C_INFO" ADD CONSTRAINT "PK_PRE_C_INFO" PRIMARY KEY ("C_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "PRE_C_INFO" MODIFY ("C_STATUS" NOT NULL ENABLE);
  ALTER TABLE "PRE_C_INFO" MODIFY ("S_CLOSED" NOT NULL ENABLE);
  ALTER TABLE "PRE_C_INFO" MODIFY ("C_CO_TIME" NOT NULL ENABLE);
  ALTER TABLE "PRE_C_INFO" MODIFY ("C_E_TIME" NOT NULL ENABLE);
  ALTER TABLE "PRE_C_INFO" MODIFY ("C_E_DATE" NOT NULL ENABLE);
  ALTER TABLE "PRE_C_INFO" MODIFY ("C_S_DATE" NOT NULL ENABLE);
  ALTER TABLE "PRE_C_INFO" MODIFY ("C_RE_DATE" NOT NULL ENABLE);
  ALTER TABLE "PRE_C_INFO" MODIFY ("C_OVERVIEW" NOT NULL ENABLE);
  ALTER TABLE "PRE_C_INFO" MODIFY ("C_NAME" NOT NULL ENABLE);
  ALTER TABLE "PRE_C_INFO" MODIFY ("PRO_ID" NOT NULL ENABLE);
  ALTER TABLE "PRE_C_INFO" MODIFY ("C_NUM" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table C_INFO
--------------------------------------------------------

  ALTER TABLE "C_INFO" ADD CONSTRAINT "PK_C_INFO" PRIMARY KEY ("C_I_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "C_INFO" MODIFY ("INS_OPINION" NOT NULL ENABLE);
  ALTER TABLE "C_INFO" MODIFY ("A_SCORE" NOT NULL ENABLE);
  ALTER TABLE "C_INFO" MODIFY ("F_SCORE" NOT NULL ENABLE);
  ALTER TABLE "C_INFO" MODIFY ("M_SCORE" NOT NULL ENABLE);
  ALTER TABLE "C_INFO" MODIFY ("STU_ID" NOT NULL ENABLE);
  ALTER TABLE "C_INFO" MODIFY ("C_NUM" NOT NULL ENABLE);
  ALTER TABLE "C_INFO" MODIFY ("C_I_NUM" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MEMBERINFO
--------------------------------------------------------

  ALTER TABLE "MEMBERINFO" ADD CONSTRAINT "PK_MEMBERINFO" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "MEMBERINFO" MODIFY ("MEM_STATUS" NOT NULL ENABLE);
  ALTER TABLE "MEMBERINFO" MODIFY ("AUTORITY" NOT NULL ENABLE);
  ALTER TABLE "MEMBERINFO" MODIFY ("YDUCODE" NOT NULL ENABLE);
  ALTER TABLE "MEMBERINFO" MODIFY ("EMAIL" NOT NULL ENABLE);
  ALTER TABLE "MEMBERINFO" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "MEMBERINFO" MODIFY ("PW" NOT NULL ENABLE);
  ALTER TABLE "MEMBERINFO" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table T_C_HISTORY
--------------------------------------------------------

  ALTER TABLE "T_C_HISTORY" ADD CONSTRAINT "PK_T_C_HISTORY" PRIMARY KEY ("ID", "T_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "T_C_HISTORY" MODIFY ("AGREE" NOT NULL ENABLE);
  ALTER TABLE "T_C_HISTORY" MODIFY ("T_NUM" NOT NULL ENABLE);
  ALTER TABLE "T_C_HISTORY" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table B_COMMENT
--------------------------------------------------------

  ALTER TABLE "B_COMMENT" ADD CONSTRAINT "PK_B_COMMENT" PRIMARY KEY ("C_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "B_COMMENT" MODIFY ("C_W_DATE" NOT NULL ENABLE);
  ALTER TABLE "B_COMMENT" MODIFY ("C_CONTENT" NOT NULL ENABLE);
  ALTER TABLE "B_COMMENT" MODIFY ("B_NUM" NOT NULL ENABLE);
  ALTER TABLE "B_COMMENT" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "B_COMMENT" MODIFY ("C_NUM" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table B_RAO
--------------------------------------------------------

  ALTER TABLE "B_RAO" ADD CONSTRAINT "PK_B_RAO" PRIMARY KEY ("B_NUM", "ID", "B_TYPE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "B_RAO" MODIFY ("B_RAO_STATUS" NOT NULL ENABLE);
  ALTER TABLE "B_RAO" MODIFY ("B_TYPE" NOT NULL ENABLE);
  ALTER TABLE "B_RAO" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "B_RAO" MODIFY ("B_NUM" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table C_STU_INFO
--------------------------------------------------------

  ALTER TABLE "C_STU_INFO" ADD CONSTRAINT "PK_C_STU_INFO" PRIMARY KEY ("C_STU_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "C_STU_INFO" MODIFY ("ATTENDANCE" NOT NULL ENABLE);
  ALTER TABLE "C_STU_INFO" MODIFY ("C_NUM" NOT NULL ENABLE);
  ALTER TABLE "C_STU_INFO" MODIFY ("STU_ID" NOT NULL ENABLE);
  ALTER TABLE "C_STU_INFO" MODIFY ("C_STU_NUM" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table AL_STATUS
--------------------------------------------------------

  ALTER TABLE "AL_STATUS" ADD CONSTRAINT "FK_MEMBERINFO_TO_AL_STATUS" FOREIGN KEY ("STU_ID")
	  REFERENCES "MEMBERINFO" ("ID") ENABLE;
  ALTER TABLE "AL_STATUS" ADD CONSTRAINT "FK_PRE_C_INFO_TO_AL_STATUS" FOREIGN KEY ("C_NUM")
	  REFERENCES "PRE_C_INFO" ("C_NUM") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BOARD
--------------------------------------------------------

  ALTER TABLE "BOARD" ADD CONSTRAINT "FK_MEMBERINFO_TO_BOARD" FOREIGN KEY ("ID")
	  REFERENCES "MEMBERINFO" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table B_COMMENT
--------------------------------------------------------

  ALTER TABLE "B_COMMENT" ADD CONSTRAINT "FK_BOARD_TO_B_COMMENT" FOREIGN KEY ("B_NUM", "B_TYPE")
	  REFERENCES "BOARD" ("B_NUM", "B_TYPE") ENABLE;
  ALTER TABLE "B_COMMENT" ADD CONSTRAINT "FK_MEMBERINFO_TO_B_COMMENT" FOREIGN KEY ("ID")
	  REFERENCES "MEMBERINFO" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table B_RAO
--------------------------------------------------------

  ALTER TABLE "B_RAO" ADD CONSTRAINT "FK_BOARD_TO_B_RAO" FOREIGN KEY ("B_NUM", "B_TYPE")
	  REFERENCES "BOARD" ("B_NUM", "B_TYPE") ENABLE;
  ALTER TABLE "B_RAO" ADD CONSTRAINT "FK_MEMBERINFO_TO_B_RAO" FOREIGN KEY ("ID")
	  REFERENCES "MEMBERINFO" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table C_INFO
--------------------------------------------------------

  ALTER TABLE "C_INFO" ADD CONSTRAINT "FK_MEMBERINFO_TO_C_INFO" FOREIGN KEY ("STU_ID")
	  REFERENCES "MEMBERINFO" ("ID") ENABLE;
  ALTER TABLE "C_INFO" ADD CONSTRAINT "FK_PRE_C_INFO_TO_C_INFO" FOREIGN KEY ("C_NUM")
	  REFERENCES "PRE_C_INFO" ("C_NUM") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table C_RAO
--------------------------------------------------------

  ALTER TABLE "C_RAO" ADD CONSTRAINT "FK_B_COMMENT_TO_C_RAO" FOREIGN KEY ("C_NUM")
	  REFERENCES "B_COMMENT" ("C_NUM") ENABLE;
  ALTER TABLE "C_RAO" ADD CONSTRAINT "FK_MEMBERINFO_TO_C_RAO" FOREIGN KEY ("ID")
	  REFERENCES "MEMBERINFO" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table C_STU_INFO
--------------------------------------------------------

  ALTER TABLE "C_STU_INFO" ADD CONSTRAINT "FK_MEMBERINFO_TO_C_STU_INFO" FOREIGN KEY ("STU_ID")
	  REFERENCES "MEMBERINFO" ("ID") ENABLE;
  ALTER TABLE "C_STU_INFO" ADD CONSTRAINT "FK_PRE_C_INFO_TO_C_STU_INFO" FOREIGN KEY ("C_NUM")
	  REFERENCES "PRE_C_INFO" ("C_NUM") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PRE_C_INFO
--------------------------------------------------------

  ALTER TABLE "PRE_C_INFO" ADD CONSTRAINT "FK_MEMBERINFO_TO_PRE_C_INFO" FOREIGN KEY ("PRO_ID")
	  REFERENCES "MEMBERINFO" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PROFESSOR_RATE
--------------------------------------------------------

  ALTER TABLE "PROFESSOR_RATE" ADD CONSTRAINT "FK_MEMBERINFO_TO_PRO_EVAL" FOREIGN KEY ("STU_ID")
	  REFERENCES "MEMBERINFO" ("ID") ENABLE;
  ALTER TABLE "PROFESSOR_RATE" ADD CONSTRAINT "FK_PRE_C_INFO_TO_PRO_EVAL" FOREIGN KEY ("C_NUM")
	  REFERENCES "PRE_C_INFO" ("C_NUM") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table T_C_HISTORY
--------------------------------------------------------

  ALTER TABLE "T_C_HISTORY" ADD CONSTRAINT "FK_MEMBERINFO_TO_T_C_HISTORY" FOREIGN KEY ("ID")
	  REFERENCES "MEMBERINFO" ("ID") ENABLE;
  ALTER TABLE "T_C_HISTORY" ADD CONSTRAINT "FK_TERMS_TO_T_C_HISTORY" FOREIGN KEY ("T_NUM")
	  REFERENCES "TERMS" ("T_NUM") ENABLE;



UPDATE PRE_C_INFO SET C_RE_DATE = TO_CHAR(C_RE_DATE, 'YYYY/MM/DD'), C_S_DATE = TO_CHAR(C_S_DATE, 'YYYY/MM/DD'), C_E_DATE = TO_CHAR(C_E_DATE, 'YYYY/MM/DD');
UPDATE C_STU_INFO SET ATTENDANCE = TO_CHAR(ATTENDANCE, 'YYYY/MM/DD');